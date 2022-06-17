package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderImpl {
    public List<Order> getAll();
    public Order insert(Order order);
    public Order update(Order order);
    public Order delete(Integer id);
    public Order findById(Integer id);
    public Page<Order> getAllPage(Pageable pageable);
    public Order getOrderByTable(Integer idTable);
    public List<Order> getAllOrder();
    public List<Order> getHistoryTable(Integer idTable);
}
