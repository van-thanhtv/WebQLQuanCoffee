package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.AreaImpl;
import com.example.thanhtvph15016_asm_java5.daoimpl.TableImpl;
import com.example.thanhtvph15016_asm_java5.entity.Table;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/table")
public class TableController {
    @Autowired
    ServletContext app;

    @Autowired
    private AreaImpl areaDao;

    @Autowired
    private TableImpl tableDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpServletResponse response;

    @Autowired
    HttpSession session;

    private Integer idCu;

    public TableController() {
        this.idCu=0;
    }

    @GetMapping("/index")
    public String index(@ModelAttribute("table") Table table, @RequestParam("page") Optional<Integer> page, Model model,@RequestParam(value = "id",required = false) Integer id) {
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        if (id!=null){
            this.idCu=id;
            model.addAttribute("area",this.areaDao.findById(id));
            model.addAttribute("list", tableDao.getAllPage(pageable,id));
        }else {
            model.addAttribute("list", tableDao.getAllPage(pageable,this.idCu));
            model.addAttribute("area",this.areaDao.findById(this.idCu));
        }
        request.setAttribute("active",5);
        model.addAttribute("view","/views/area/detailArea.jsp");
        return "layout";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("table") Table table) {
        try {
            table.setIdArea(this.areaDao.findById(this.idCu));
            table.setStatus(0);
            table.setIsActivity(0);
            this.tableDao.insert(table);
            session.setAttribute("message", "Thêm Mới Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/table/index";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute("table") Table table, @RequestParam(name = "id") Integer id) {
        try {
            Table t = this.tableDao.findById(id);
            t.setLocation(table.getLocation());
            tableDao.update(t);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/table/index";
    }
    @PostMapping("/restore")
    public String restore(@ModelAttribute("table") Table table, @RequestParam(name = "id") Integer id) {
        try {
            Table t = this.tableDao.findById(id);
            t.setStatus(0);
            tableDao.update(t);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/table/index";
    }
    @PostMapping("/delete")
    public String delete(@ModelAttribute("table") Table table, @RequestParam(name = "id") Integer id) {
        if (id==0){
            String[] ds = request.getParameterValues("options");
            if (ds!=null){
                for (String s:ds) {
                    Table tableUp = tableDao.findById(Integer.parseInt(s));
                    tableUp.setStatus(1);
                    tableDao.update(tableUp);
                    session.setAttribute("message", "Xóa Thành Công");
                }
            }else {
                session.setAttribute("error", "Bạn chưa chọn user muốn xóa!");
            }
        }else {
            try {
                Table tableUp = tableDao.findById(id);
                tableUp.setStatus(1);
                tableDao.update(tableUp);
                request.setAttribute("list", areaDao.getAll());
                session.setAttribute("message", "Xóa Thành Công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Xóa Thất Bại");
                System.out.println("Xóa thất bại");
            }
        }
        return "redirect:/table/index";
    }
}
