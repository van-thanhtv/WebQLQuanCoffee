package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.UserImpl;
import com.example.thanhtvph15016_asm_java5.entity.User;
import com.example.thanhtvph15016_asm_java5.utils.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {
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

    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/index")
    public String index(@ModelAttribute("user") User user, @RequestParam("page") Optional<Integer> page, Model model,@RequestParam(name = "img" ,required = false) MultipartFile img) {
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        model.addAttribute("list", userDao.getAllPage(pageable));
        model.addAttribute("view","/views/user/from.jsp");
        return "layout";
    }


    @PostMapping("/add")
    public String add(@ModelAttribute("user") User user, @RequestParam(name = "img" ,required = false) MultipartFile img) {
        try {
            String image = "NoImage.png";
            Path path = Paths.get("avatars/");
            //save
            if (img.isEmpty()) {

            } else {
                try {
                    InputStream inputStream = img.getInputStream();
                    Files.copy(inputStream, path.resolve(img.getOriginalFilename()),
                            StandardCopyOption.REPLACE_EXISTING);
                    image = img.getOriginalFilename().toString();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            user.setImage(image);
            user.setPassword(EncryptUtil.encrypt(user.getPassword()));
            user.setStatus(0);
            userDao.insert(user);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/user/index";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id") Integer id, Model model, @ModelAttribute("user") User user,@RequestParam("page") Optional<Integer> page,@RequestParam(name = "img" ,required = false) MultipartFile img) {
        model.addAttribute("u", userDao.findById(id));
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        model.addAttribute("list", userDao.getAllPage(pageable));
        model.addAttribute("view","/views/user/from.jsp");
        return "layout";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("user") User user, @RequestParam(name = "id") Integer id,@RequestParam(name = "img" ,required = false) MultipartFile img) {
        String image = "NoImage.png";
        Path path = Paths.get("avatars/");
        User u = userDao.findById(user.getId());
        //save
        if (img.isEmpty()) {
            image=u.getImage();
        } else {
            try {
                InputStream inputStream = img.getInputStream();
                Files.copy(inputStream, path.resolve(img.getOriginalFilename()),
                        StandardCopyOption.REPLACE_EXISTING);
                image = img.getOriginalFilename().toString();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            User p = userDao.findById(id);
            user.setPassword(p.getPassword());
            user.setEmail(p.getEmail());
            user.setImage(image);
            userDao.update(user);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/user/index";
    }

    @PostMapping("/delete")
    public String delete(@ModelAttribute("user") User user, @RequestParam(name = "id") Integer id) {
        if (id==0){
            String[] ds = request.getParameterValues("options");
            if (ds!=null){
                for (String s:ds) {
                    userDao.delete(Integer.parseInt(s));
                    session.setAttribute("message", "Xoa Thành Công");
                }
            }else {
                session.setAttribute("error", "Bạn chưa chọn user muốn xóa!");
            }
        }else {
            try {
                userDao.delete(id);
                System.out.println("Xóa 1");
                request.setAttribute("list", userDao.getAll());
                session.setAttribute("message", "Xoa Thành Công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Xoa Thất Bại");
                System.out.println("Xóa thất bại");
            }
        }
        return "redirect:/user/index";
    }
    @GetMapping("/search")
    public String search(@ModelAttribute("user") User product, @RequestParam(name = "search") String search,@RequestParam("page") Optional<Integer> page,Model model) {

        this.userDao.search(search,100,0);
        request.setAttribute("active",1);
        List<User> list = new ArrayList<>();
        try {

            if (list.size()>0){
                session.setAttribute("message", "Tim Thành Công");
            }else {
                session.setAttribute("error", "Tim Thất Bại");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Tim Thất Bại");
        }
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        int start = (int)pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), list.size());
        request.setAttribute("list", new PageImpl<>(list.subList(start, end), pageable, list.size()));
        model.addAttribute("view","/views/user/from.jsp");
        return "layout";
    }
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("active", 1);
    }
}
