package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.UserImpl;
import com.example.thanhtvph15016_asm_java5.entity.User;
import com.example.thanhtvph15016_asm_java5.model.MailModel;
import com.example.thanhtvph15016_asm_java5.service.MailerService;
import com.example.thanhtvph15016_asm_java5.utils.EncryptUtil;
import com.example.thanhtvph15016_asm_java5.utils.Random;
import com.example.thanhtvph15016_asm_java5.utils.XCookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    ServletContext app;
    @Autowired
    UserImpl userDao;
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpServletResponse response;

    @Autowired
    HttpSession session;

    @Autowired
    MailerService sender;

    @GetMapping("/login")
    public String login(@ModelAttribute("user") User user,Model model){
        String remmeber = XCookie.get(request, "user_remmeber", null);
        if (remmeber != null && remmeber != "0") {
            request.setAttribute("sessionUserRemmeber", userDao.findById(Integer.valueOf(remmeber)));
        }
        return "login";
    }
    @GetMapping("/signout")
    public String signout(){
        System.out.println("logout");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("sessionUser");
        if (u != null) {
            XCookie.add(response, "sessionUser", "0", 0);
            request.getSession().removeAttribute("sessionUser");
        }
        return "redirect:login";
    }
    @GetMapping("/forgot")
    public String forgot(@ModelAttribute("mail") MailModel mailModel,Model model){
        return  "forgotPassword";
    }
    @PostMapping("/register")
    public String register(@ModelAttribute("user") User user,Model model){

        if (user == null) {
            model.addAttribute("result", "false");
            model.addAttribute("message", "Đăng ký thất bại! Code: -1");
            model.addAttribute("user", user);
        } else {
            if (!user.getPassword().equals(request.getParameter("passwordConfirm"))){
                model.addAttribute("result", "false");
                model.addAttribute("message", "Mật khẩu xác nhận không chính xác");
                model.addAttribute("user", user);
            }else {
                User u = userDao.findByEmail(user.getEmail());
                if (u != null) {
                    model.addAttribute("user", user);
                    model.addAttribute("result", "false");
                    if (u.getEmail().equalsIgnoreCase(user.getEmail()))
                        model.addAttribute("message", "Tài khoản đã tồn tại!");
                } else {
                    user.setIsAdmin(2);
                    user.setStatus(0);
                    try {
                        user.setPassword(EncryptUtil.encrypt(user.getPassword()));
                        user = userDao.insert(user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (user == null) {
                        model.addAttribute("result", "false");
                        model.addAttribute("message", "Đăng ký thất bại! Code: -1");
                        model.addAttribute("user", user);
                    } else {
                        model.addAttribute("message", "Đăng ký thành công, bạn hiện có thể đăng nhập ngay bây giờ ");
                    }
                }
            }
        }
        return "login";
    }
    @PostMapping("/send")
    public String send(@ModelAttribute("mail") MailModel mailModel, Model model){
        Random random = new Random();
        String passUp = random.randomAlphaNumeric(6);
        User userUpdate = this.userDao.findByEmail(mailModel.getTo());
        if (userUpdate==null){
            model.addAttribute("messgare","Email bạn nhập chưa được đăng kí");
        }else {
            userUpdate.setPassword(EncryptUtil.encrypt(passUp));
        }
        sender.push(mailModel.getTo(),"Email to reset password","Your password is :"+passUp+"\n" +
                "Please do not give this password to anyone else");
        model.addAttribute("messgare","Mật khẩu của bạn được gưởi đi trong giây lát");
        return  "forgotPassword";
    }
    @PostMapping("/login")
    public String Plogin(@ModelAttribute("user")User user){
        User u = userDao.findByEmail(user.getEmail());
        if (u == null || !EncryptUtil.check(user.getPassword(), u.getPassword())) {
            request.setAttribute("result", "error");
            request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
        } else {
            if (request.getParameter("remember") != null) {
                XCookie.add(response, "user_remmeber",String.valueOf(u.getId()), 600);
            }
            request.getServletContext().setAttribute("sessionUser", u);
            request.getSession().setAttribute("sessionUser", u);
            request.setAttribute("result", "success");
            request.setAttribute("message", "Đăng nhập thành công, bạn sẽ được di chuyển về trang chủ!");
        }
        return "login";
    }
}
