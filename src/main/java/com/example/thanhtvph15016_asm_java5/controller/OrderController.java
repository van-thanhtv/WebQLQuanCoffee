package com.example.thanhtvph15016_asm_java5.controller;

import com.example.thanhtvph15016_asm_java5.daoimpl.*;
import com.example.thanhtvph15016_asm_java5.entity.*;
import com.example.thanhtvph15016_asm_java5.model.CartModel;
import com.example.thanhtvph15016_asm_java5.utils.XCookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private ServletContext app;

    @Autowired
    private OrderImpl orderDao;

    @Autowired
    private OrderDetailImpl orderDetailDao;

    @Autowired
    private AreaImpl areaDao;

    @Autowired
    private TableImpl tableDao;

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

    private Integer idCu;
    private Integer idTable;
    private Integer idTypeCu;
    private Integer idOrderHistory;
    private BigDecimal total;
    private static final String PATTERN_FORMAT = "hh:mm:ss a";
    private static final String PATTERN_FORMAT_Date = "dd-MM-yyyy hh:mm:ss a";
    private static final DecimalFormat df = new DecimalFormat("#,###.000");
    private DateTimeFormatter formatter;
    private DateTimeFormatter formatter_Date;

    public OrderController() {
        this.idCu = 0;
        this.idTable = 0;
        this.idTypeCu = 0;
        this.formatter = DateTimeFormatter.ofPattern(PATTERN_FORMAT)
                .withZone(ZoneId.systemDefault());
        this.formatter_Date = DateTimeFormatter.ofPattern(PATTERN_FORMAT_Date)
                .withZone(ZoneId.systemDefault());
        this.total= new BigDecimal(0);
        this.idOrderHistory =0;
    }

    @Autowired
    private HttpSession session;

    @GetMapping("/index")
    public String index(@ModelAttribute("order") OrderDetail orderDetail,@ModelAttribute("orderDetail") OrderDetail orderDetail1,@ModelAttribute("orderd") Order order, @RequestParam("page") Optional<Integer> page, Model model, @RequestParam(value = "id", required = false) Integer id, @RequestParam(value = "idType", required = false) Integer idType, @RequestParam(value = "idWater", required = false) Integer idWater) {
        model.addAttribute("listArge", this.areaDao.getAll());
        model.addAttribute("listOder", this.orderDao.getAllOrder());
        model.addAttribute("listType", this.waterTypeDao.getAll());
        model.addAttribute("idTableCu", this.idTable);
        model.addAttribute("idOrderHistory", this.idOrderHistory);

        Pageable pageable = PageRequest.of(page.orElse(0), 20);

        //Lấy dữ liệu cửa cooki đẩy vao bảng order detail
        if (this.idOrderHistory!=0){
            List<Order> l = this.orderDao.getHistoryTable(this.idOrderHistory);
            model.addAttribute("listHistory", l);
        }
        if (this.idTable != 0) {
            Table table = this.tableDao.findById(this.idTable);
            model.addAttribute("TableCu", table);
            this.idOrderHistory=0;
            model.addAttribute("idOrderHistory", this.idOrderHistory);
            model.addAttribute("tableNow", this.tableDao.findById(this.idTable));
            Table iTable = this.tableDao.findById(this.idTable);
            List<CartModel> listCaet = new ArrayList<>();
            if (iTable.getIsActivity() == 1) {
                Order nowOrder = this.orderDao.getOrderByTable(this.idTable);
                if (nowOrder.getOrderDetailList().get(0).getIdTable().getId() == iTable.getId()) {
                    model.addAttribute("order", nowOrder);
                    model.addAttribute("timeTable", this.formatter.format(nowOrder.getDateOrder()));
                    for (OrderDetail od:nowOrder.getOrderDetailList()) {
                            CartModel c = new CartModel();
                            c.setIdWater(od.getIdWater());
                            c.setQuantity(od.getQuantity());
                            c.setIdDetail(od);
                            listCaet.add(c);
                    }
                }
            } else {
                model.addAttribute("order", null);
            }
            Cookie arr[] = request.getCookies();
            List<CartModel> cartModelList = new ArrayList<CartModel>();
            for (Cookie o : arr) {
                if (o.getName().equals(String.valueOf(this.idTable))) {
                    String txt[] = o.getValue().split("p");
                    for (String s : txt) {
                        if (!s.equals("")) {
                            CartModel newCartModel = new CartModel();
                            newCartModel.setIdWater(this.waterDao.findById(Integer.parseInt(s)));
                            cartModelList.add(newCartModel);
                        }
                    }
                }
            }
            int count = 1;
            for (int i = 0; i < cartModelList.size(); i++) {
                count = 1;
                for (int j = i + 1; j < cartModelList.size(); j++) {
                    if (cartModelList.get(i) != null && cartModelList.get(j) != null) {
                        if (cartModelList.get(i).getIdWater() == cartModelList.get(j).getIdWater()) {
                            count++;
                            cartModelList.remove(j);
                            j--;
                            cartModelList.get(i).setQuantity(count);
                        }
                    }
                }
                cartModelList.get(i).setQuantity(count);

            }
            cartModelList.addAll(listCaet);
            BigDecimal total = new BigDecimal(0);
            for (CartModel o : cartModelList) {
                if (o.getIdDetail()==null){
                    total = total.add(o.getIdWater().getPrice().multiply(BigDecimal.valueOf(count)));
                }else {
                    if (o.getIdDetail().getStatus()==0){
                        total = total.add(o.getIdWater().getPrice().multiply(BigDecimal.valueOf(count)));
                    }
                }
            }
            this.total=total;
            model.addAttribute("listCart", cartModelList);
        }
            model.addAttribute("total", this.total);
        if (id != null) {
            model.addAttribute("listTable", this.tableDao.getAllByIdArea(id));
            this.idCu = id;
            model.addAttribute("idCu", this.idCu);
        } else if (this.idCu == 0) {
            model.addAttribute("listTable", this.tableDao.getAllByIdArea(this.areaDao.getAll().get(0).getId()));
        } else {
            model.addAttribute("listTable", this.tableDao.getAllByIdArea(this.idCu));
            model.addAttribute("idCu", this.idCu);
        }
        if (idType != null) {
            model.addAttribute("listWater", this.waterDao.findAllByIdType(idType, pageable));
            this.idTypeCu = idType;
            model.addAttribute("idTypeCu", this.idTypeCu);
        } else if (this.idCu == 0) {
            model.addAttribute("listWater", waterDao.getAllPage(pageable));
        } else {
            model.addAttribute("listWater", waterDao.getAllPage(pageable));
        }

        model.addAttribute("view", "/views/Order/from.jsp");
        return "layout";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("order") Order order) {
        if (order.getId()!=null){
            try {
                Order idOrder = this.orderDao.findById(order.getId());
                Cookie arr[] = request.getCookies();
                List<CartModel> cartModelList = new ArrayList<CartModel>();
                for (Cookie o : arr) {
                    if (o.getName().equals(String.valueOf(this.idTable))) {
                        String txt[] = o.getValue().split("p");
                        for (String s : txt) {
                            if (!s.equals("")) {
                                CartModel newCartModel = new CartModel();
                                newCartModel.setIdWater(this.waterDao.findById(Integer.parseInt(s)));
                                cartModelList.add(newCartModel);
                            }
                        }
                    }
                }
                int count = 1;
                for (int i = 0; i < cartModelList.size(); i++) {
                    count = 1;
                    for (int j = i + 1; j < cartModelList.size(); j++) {
                        if (cartModelList.get(i) != null && cartModelList.get(j) != null) {
                            if (cartModelList.get(i).getIdWater() == cartModelList.get(j).getIdWater()) {
                                count++;
                                cartModelList.remove(j);
                                j--;
                                cartModelList.get(i).setQuantity(count);
                            }
                        }
                    }
                    cartModelList.get(i).setQuantity(count);
                }
                BigDecimal total = new BigDecimal(0);
                for (CartModel o : cartModelList) {
                    total = total.add(o.getIdWater().getPrice().multiply(BigDecimal.valueOf(count)));
                }
                Table idTable = this.tableDao.findById(this.idTable);
                idTable.setIsActivity(1);
                this.tableDao.update(idTable);
                for (CartModel c : cartModelList) {
                    OrderDetail neworderDetail = new OrderDetail();
                    neworderDetail.setStatus(0);
                    neworderDetail.setIdWater(c.getIdWater());
                    neworderDetail.setIdTable(idTable);
                    neworderDetail.setIdOrder(idOrder);
                    neworderDetail.setNote(idOrder.getIdUser().getName()+" Time Update: "+this.formatter_Date.format(Instant.now()));
                    neworderDetail.setQuantity(c.getQuantity());
                    this.orderDetailDao.insert(neworderDetail);
                }
                XCookie.add(response, String.valueOf(this.idTable),"0", 0);
                Cookie c = new Cookie(String.valueOf(this.idTable), String.valueOf(0));
                c.setMaxAge(0);
                response.addCookie(c);
                session.setAttribute("message", "Gưởi hóa đơn thành công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Gưởi hóa đơn thất bại");
            }
        }else {
            User u = (User) request.getSession().getAttribute("sessionUser");
            Order newOrder = new Order();
            newOrder.setDateOrder(Instant.now());
            newOrder.setIdUser(u);
            newOrder.setStatus(0);
            try {
                Order idOrder = this.orderDao.insert(newOrder);
                Cookie arr[] = request.getCookies();
                List<CartModel> cartModelList = new ArrayList<CartModel>();
                for (Cookie o : arr) {
                    if (o.getName().equals(String.valueOf(this.idTable))) {
                        String txt[] = o.getValue().split("p");
                        for (String s : txt) {
                            if (!s.equals("")) {
                                CartModel newCartModel = new CartModel();
                                newCartModel.setIdWater(this.waterDao.findById(Integer.parseInt(s)));
                                cartModelList.add(newCartModel);
                            }
                        }
                    }
                }
                int count = 1;
                for (int i = 0; i < cartModelList.size(); i++) {
                    count = 1;
                    for (int j = i + 1; j < cartModelList.size(); j++) {
                        if (cartModelList.get(i) != null && cartModelList.get(j) != null) {
                            if (cartModelList.get(i).getIdWater() == cartModelList.get(j).getIdWater()) {
                                count++;
                                cartModelList.remove(j);
                                j--;
                                cartModelList.get(i).setQuantity(count);
                            }
                        }
                    }
                    cartModelList.get(i).setQuantity(count);
                }
                BigDecimal total = new BigDecimal(0);
                for (CartModel o : cartModelList) {
                    total = total.add(o.getIdWater().getPrice().multiply(BigDecimal.valueOf(count)));
                }
                Table idTable = this.tableDao.findById(this.idTable);
                idTable.setIsActivity(1);
                this.tableDao.update(idTable);
                for (CartModel c : cartModelList) {
                    OrderDetail neworderDetail = new OrderDetail();
                    neworderDetail.setStatus(0);
                    neworderDetail.setIdWater(c.getIdWater());
                    neworderDetail.setIdTable(idTable);
                    neworderDetail.setIdOrder(idOrder);
                    neworderDetail.setQuantity(c.getQuantity());
                    neworderDetail.setNote(idOrder.getIdUser().getName()+" Time order: "+this.formatter_Date.format(Instant.now()));
                    this.orderDetailDao.insert(neworderDetail);
                }
                XCookie.add(response, String.valueOf(this.idTable),"0", 0);
                Cookie c = new Cookie(String.valueOf(this.idTable), String.valueOf(0));
                c.setMaxAge(0);
                response.addCookie(c);
                session.setAttribute("message", "Gưởi hóa đơn thành công");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Gưởi hóa đơn thất bại");

            }
        }
        return "redirect:/order/index";
    }

    @PostMapping("/update")
    public String update(@RequestParam(value = "id", required = false) Integer id) {
        try {
            Order order = this.orderDao.findById(id);
            order.setStatus(1);
            order.setTotalPrice(this.total);
            Table t = order.getOrderDetailList().get(0).getIdTable();
            t.setIsActivity(0);
            this.orderDao.update(order);
            this.tableDao.update(t);
            this.idTable=0;
            session.setAttribute("message", "Thanh toán thành công");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Cập Nhật Thất Bại");
        }
        return "redirect:/order/index";
    }

    @GetMapping("/sub")
    public String sub(@RequestParam(value = "idWater", required = false) Integer idWater) {
        Cookie arr[] = request.getCookies();
        String txt = "";
        for (Cookie o : arr) {
            if (o.getName().equals(String.valueOf(this.idTable))) {

                txt = txt + o.getValue();
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        String ids[] = txt.split("p");
        String txtOutPut = "";
        int check = 0;
        for (int i = 0; i < ids.length; i++) {
            if (ids[i].equals(String.valueOf(idWater))) {
                check++;
            }
            if (check != 1) {
                if (txtOutPut.isEmpty()) {
                    txtOutPut = ids[i];
                } else {
                    txtOutPut = txtOutPut + "p" + ids[i];
                }
            } else {
                check++;
            }
        }
        if (!txtOutPut.isEmpty()) {
            XCookie.add(response, String.valueOf(this.idTable), String.valueOf(txtOutPut), 24);
        }
        return "redirect:/order/index";
    }

    @GetMapping("/cart")
    public String cart(@RequestParam(value = "idWater", required = false) Integer idWater, Model model) {
        if (this.idTable == 0) {
            session.setAttribute("error", "Bạn chưa vào bàn");
        } else {
            Cookie arr[] = request.getCookies();
            String txt = "";
            for (Cookie o : arr) {
                if (o.getName().equals(String.valueOf(this.idTable))) {
                    txt = txt + o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
            if (txt.isEmpty()) {
                txt = String.valueOf(idWater);
            } else {
                txt = txt + "p" + String.valueOf(idWater);
            }
            XCookie.add(response, String.valueOf(this.idTable), String.valueOf(txt), 24);
            session.setAttribute("message", "Thêm vào thành công Thành Công");
        }
        return "redirect:/order/index";
    }

    @GetMapping("/inToTable")
    public String inToTable(@RequestParam(value = "idTable", required = false) Integer idTable, Model model) {
        this.idTable = idTable;
        return "redirect:/order/index";
    }

    @PostMapping("/move")
    private String moveTable(@RequestParam(value = "id", required = false) Integer idTableMove, Model model){
        try {
            Table table = this.tableDao.findById(this.idTable);
            if (table.getIsActivity()==0){
                session.setAttribute("error", "Chuyển bàn thất bại(Bàn bạn chưa order)");
            }else {
                Table tableMove = this.tableDao.findById(idTableMove);
                table.setIsActivity(0);
                tableMove.setIsActivity(1);
                Order orderTableold = this.orderDao.getOrderByTable(table.getId());
                for (OrderDetail od:orderTableold.getOrderDetailList()) {
                    od.setIdTable(tableMove);
                    this.orderDetailDao.update(od);
                }
                orderTableold.setReason("Chuyển từ  "+table.getIdArea().getName()+"  Bàn :"+table.getLocation() +"Đến "+tableMove.getIdArea().getName()+"  Bàn: "+tableMove.getLocation());
                this.orderDao.update(orderTableold);
                this.idTable=idTableMove;
                session.setAttribute("message", "Chuyển bàn thành công");
            }
        }catch (Exception e){
            e.printStackTrace();
            session.setAttribute("error", "Chuyển bàn thất bại");
        }
        return "redirect:/order/index";
    }
    @PostMapping("/merge")
    private String mergeTable(@RequestParam(value = "id", required = false) Integer idTableMove, Model model){
        try {
            Table table = this.tableDao.findById(this.idTable);
            if (table.getIsActivity()==0){
                session.setAttribute("error", "Gộp bàn thất bại(Bàn bạn chưa order)");
            }else {
                Table tableMove = this.tableDao.findById(idTableMove);
                table.setIsActivity(0);
                tableMove.setIsActivity(1);
                Order orderTableold = this.orderDao.getOrderByTable(table.getId());
                Order orderTableoNow = this.orderDao.getOrderByTable(tableMove.getId());
                for (OrderDetail od:orderTableold.getOrderDetailList()) {
                    od.setIdTable(tableMove);
                    od.setIdOrder(orderTableoNow);
                    od.setReason("Gộp từ "+table.getIdArea().getName()+"  Bàn :"+table.getLocation() +"Đến "+tableMove.getIdArea().getName()+"  Bàn: "+tableMove.getLocation());
                    this.orderDetailDao.update(od);
                }
                this.orderDao.delete(orderTableold.getId());
                this.idTable=idTableMove;
                session.setAttribute("message", "Gộp bàn thành công");
            }
        }catch (Exception e){
            e.printStackTrace();
            session.setAttribute("error", "Gộp bàn thất bại");
        }
        return "redirect:/order/index";
    }
    @PostMapping("/cancellation")
    public String Cancellation(@ModelAttribute("orderDetail") OrderDetail orderDetail){
        OrderDetail orderDetail1 = this.orderDetailDao.findById(orderDetail.getId());
        System.out.println(orderDetail1.getIdOrder().getId());
        Order idOrder = this.orderDao.findById(orderDetail1.getIdOrder().getId());
        orderDetail1.setStatus(1);
        orderDetail1.setReason(idOrder.getIdUser().getName()+"Time cancel: "+this.formatter_Date.format(Instant.now())+"\nReason :" +orderDetail.getReason());
        try {
            this.orderDetailDao.update(orderDetail1);
            session.setAttribute("message", "Hủy món thành công");
        }catch (Exception e){

        }
        return "redirect:/order/index";
    }
    @PostMapping("/delete")
    public String deleteCart(@ModelAttribute("orderd") Order order,@RequestParam(value = "idWater", required = false) Integer idWater) {
        Cookie arr[] = request.getCookies();
        String txt = "";
        if (idWater==0){
            Table t = this.tableDao.findById(this.idTable);
            t.setIsActivity(0);
            Order nowOrder = this.orderDao.getOrderByTable(this.idTable);
            nowOrder.setStatus(2);
            nowOrder.setReason(order.getReason());
            this.orderDao.update(nowOrder);
            this.tableDao.update(t);
            this.idTable=0;
            Cookie c = new Cookie(String.valueOf(this.idTable), String.valueOf(0));
            c.setMaxAge(0);
            response.addCookie(c);
        }else {
            for (Cookie o : arr) {
                if (o.getName().equals(String.valueOf(this.idTable))) {
                    XCookie.add(response, String.valueOf(this.idTable), txt = txt + o.getValue(), 0);
                }
            }
            String ids[] = txt.split("p");
            String txtOutPut = "";
            int check = 0;
            for (int i = 0; i < ids.length; i++) {
                if (!ids[i].equals(String.valueOf(idWater))) {
                    check++;
                    if (txtOutPut.isEmpty()) {
                        txtOutPut = ids[i];
                    } else {
                        txtOutPut = txtOutPut + "p" + ids[i];
                    }
                }
            }
            if (check == 0) {
                Cookie c = new Cookie(String.valueOf(this.idTable), String.valueOf(0));
                c.setMaxAge(0);
                response.addCookie(c);
            } else {
                if (!txtOutPut.isEmpty()) {
                    Cookie c = new Cookie(String.valueOf(this.idTable), txtOutPut);
                    c.setMaxAge(60 * 60 * 24);
                    response.addCookie(c);
                }
            }
        }
        return "redirect:/order/index";
    }

    @GetMapping("history")
    private String history(@RequestParam(value = "idTable",required = false) Integer idTable){
        this.idOrderHistory = idTable;
        this.idTable=0;
        return "redirect:/order/index";
    }
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("active", 4);
        model.addAttribute("localDateTimeFormat", this.formatter);
        model.addAttribute("df", this.df);
    }
}
