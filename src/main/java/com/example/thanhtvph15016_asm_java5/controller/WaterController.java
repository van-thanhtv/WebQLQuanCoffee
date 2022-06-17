package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.*;
import com.example.thanhtvph15016_asm_java5.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Optional;

@Controller
@RequestMapping("/water")
public class WaterController {
    @Autowired
    private ServletContext app;

    @Autowired
    private WaterImpl waterDao;

    @Autowired
    private WaterTypeImpl waterTypeDao;

    @Autowired
    private SizeImpl sizeDao;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    @Autowired
    private HttpSession session;

    private static final DecimalFormat df = new DecimalFormat("#,###.000");

    @GetMapping("/index")
    public String index(@ModelAttribute("water") Water water, @RequestParam("page") Optional<Integer> page, Model model, @RequestParam(value = "nameSize",required = false) String nameSize , @RequestParam(value = "nameType",required = false) String nameType ,@RequestParam(name = "img" ,required = false) MultipartFile img) {
        String[] arr = new String[this.sizeDao.getAll().size()];
        String[] arrType = new String[this.waterTypeDao.getAll().size()];
        for (Size s:this.sizeDao.getAll()) {
            arr[this.sizeDao.getAll().indexOf(s)] = s.getNameSize();
        }
        for (WaterType s:this.waterTypeDao.getAll()) {
            arrType[this.waterTypeDao.getAll().indexOf(s)] = s.getNameType();
        }
        StringBuilder listSize = new StringBuilder();
        for(int i=0;i<arr.length;i++){
            if (i==arr.length-1){
                listSize.append('"'+arr[i]+'"');
            }else {
                listSize.append('"'+arr[i]+'"'+",");
            }
        }
        StringBuilder listType = new StringBuilder();
        for(int i=0;i<arrType.length;i++){
            if (i==arrType.length-1){
                listType.append('"'+arrType[i]+'"');
            }else {
                listType.append('"'+arrType[i]+'"'+",");
            }
        }
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        model.addAttribute("list", waterDao.getAllPage(pageable));
        request.setAttribute("listType", listType);
        request.setAttribute("listType1", this.waterTypeDao.getAll());
        request.setAttribute("listSize1", this.sizeDao.getAll());
        request.setAttribute("listSize",listSize);
        model.addAttribute("view","/views/water/from.jsp");
        return "layout";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("water") Water water, @RequestParam("page") Optional<Integer> page, Model model, @RequestParam(value = "nameSize",required = false) String nameSize ,@RequestParam(value = "nameType",required = false) String nameType,@RequestParam(name = "img" ,required = false) MultipartFile img) {
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
            WaterType idType = this.waterTypeDao.findByNameType(nameType);
            Size isSize = this.sizeDao.findByNameSize(nameSize);
            if(idType==null){
                WaterType newWaterType = new WaterType();
                newWaterType.setNameType(nameType);
                idType=this.waterTypeDao.insert(newWaterType);
            }else {
                System.out.println("Cũ");
            }
            if (isSize==null){
                Size newSize = new Size();
                newSize.setNameSize(nameSize);
                isSize = this.sizeDao.insert(newSize);
            }else {
                System.out.println("Size Cu");
            }
            water.setImage(image);
            water.setStatus(0);
            water.setIdSize(isSize);
            water.setIdType(idType);
            water.setCreateDate(new Date(new java.util.Date().getTime()));
            this.waterDao.insert(water);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/water/index";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute("water") Water water, @RequestParam("page") Optional<Integer> page, Model model, @RequestParam(value = "nameSize",required = false) String nameSize ,@RequestParam(value = "nameType",required = false) String nameType,@RequestParam(name = "img" ,required = false) MultipartFile img) {
        String image = "NoImage.png";
        Path path = Paths.get("avatars/");
        Water w = waterDao.findById(water.getId());
        //save
        if (img.isEmpty()) {
            image=w.getImage();
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
            WaterType idType = this.waterTypeDao.findByNameType(nameType);
            Size isSize = this.sizeDao.findByNameSize(nameSize);
            if(idType==null){
                WaterType newWaterType = new WaterType();
                newWaterType.setNameType(nameType);
                idType=this.waterTypeDao.insert(newWaterType);
            }else {
                System.out.println("Cũ");
            }
            if (isSize==null){
                Size newSize = new Size();
                newSize.setNameSize(nameSize);
                isSize = this.sizeDao.insert(newSize);
            }else {
                System.out.println("Size Cu");
            }
            water.setIdSize(isSize);
            water.setIdType(idType);
            water.setCreateDate(w.getCreateDate());
            water.setStatus(w.getStatus());
            water.setImage(image);
            waterDao.update(water);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/water/index";
    }
    @PostMapping("/delete")
    public String delete(@ModelAttribute("water") Water water, @RequestParam(name = "id") Integer id) {
        if (id==0){
            String[] ds = request.getParameterValues("options");
            if (ds!=null){
                for (String s:ds) {
                    water = this.waterDao.findById(Integer.parseInt(s));
                    water.setStatus(1);
                    this.waterDao.update(water);
                    session.setAttribute("message", "Xoa Thành Công");
                }
            }else {
                session.setAttribute("error", "Bạn chưa chọn user muốn xóa!");
            }
        }else {
            try {
                water = this.waterDao.findById(id);
                water.setStatus(1);
                this.waterDao.update(water);

                session.setAttribute("message", "Xoa Thành Công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Xoa Thất Bại");
                System.out.println("Xóa thất bại");
            }
        }
        return "redirect:/water/index";
    }
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("active", 3);
        model.addAttribute("df", this.df);
    }
}
