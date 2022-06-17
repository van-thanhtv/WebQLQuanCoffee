package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.AreaImpl;
import com.example.thanhtvph15016_asm_java5.daoimpl.TableImpl;
import com.example.thanhtvph15016_asm_java5.entity.Area;
import com.example.thanhtvph15016_asm_java5.entity.Table;
import com.example.thanhtvph15016_asm_java5.model.AreaModel;
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
@RequestMapping("/area")
public class AreaController {
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
    @GetMapping("/index")
    public String index(@ModelAttribute("area") AreaModel areaModel, @RequestParam("page") Optional<Integer> page, Model model) {
        request.setAttribute("active",2);
        Pageable pageable= PageRequest.of(page.orElse(0),5);
        model.addAttribute("list", areaDao.getAllPage(pageable));
        model.addAttribute("view","/views/area/from.jsp");
        return "layout";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("area") AreaModel areaModel) {
        try {
            Area newArea = new Area();
            areaModel.setStatus(0);
            newArea.setMaxTable(areaModel.getMaxTable());
            newArea.setName(areaModel.getName());
            if (areaModel.getMaxTable()<=0){
                session.setAttribute("error", "Max Table > 0");
            }else if (areaModel.getAmount()<=0){
                session.setAttribute("error", "Amount Table > 0");
            }else {
                if (areaModel.getMaxTable()<areaModel.getAmount()){
                    session.setAttribute("error", "Amount Table >= Max Table");
                }else {
                    newArea.setStatus(0);
                    Area idArea = this.areaDao.insert(newArea);
                    for (int i=1;i<=areaModel.getAmount();i++){
                        Table newTable = new Table();
                        newTable.setIdArea(idArea);
                        newTable.setStatus(0);
                        newTable.setLocation(i);
                        newTable.setIsActivity(0);
                        this.tableDao.insert(newTable);
                    }
                    session.setAttribute("message", "Thêm Mới Thành Công");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Thêm Mới Thất Bại");
        }
        return "redirect:/area/index";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute("area") Area area, @RequestParam(name = "id") Integer id) {
        try {
            Area a=this.areaDao.findById(id);
            area.setStatus(a.getStatus());
            areaDao.update(area);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/area/index";
    }
    @PostMapping("/restore")
    public String restore(@ModelAttribute("area") Area area, @RequestParam(name = "id") Integer id) {
        try {
            Area a=this.areaDao.findById(id);
            a.setStatus(0);
            areaDao.update(a);
            session.setAttribute("message", "Cập Nhật Thành Công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/area/index";
    }
    @PostMapping("/delete")
    public String delete(@ModelAttribute("area") Area area, @RequestParam(name = "id") Integer id) {
        if (id==0){
            String[] ds = request.getParameterValues("options");
            if (ds!=null){
                for (String s:ds) {
                    Area areaUp = areaDao.findById(Integer.parseInt(s));
                    areaUp.setStatus(1);
                    areaDao.update(areaUp);
                    session.setAttribute("message", "Xóa Thành Công");
                }
            }else {
                session.setAttribute("error", "Bạn chưa chọn user muốn xóa!");
            }
        }else {
            try {
                Area areaUp = areaDao.findById(id);
                areaUp.setStatus(1);
                areaDao.update(areaUp);
                request.setAttribute("list", areaDao.getAll());
                session.setAttribute("message", "Xóa Thành Công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Xóa Thất Bại");
                System.out.println("Xóa thất bại");
            }
        }
        return "redirect:/area/index";
    }
}
