package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.OrderDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderDetailImpl {
    public List<OrderDetail> getAll();
    public OrderDetail insert(OrderDetail orderDetail);
    public OrderDetail update(OrderDetail orderDetail);
    public OrderDetail delete(Integer id);
    public OrderDetail findById(Integer id);
    public Page<OrderDetail> getAllPage(Pageable pageable);
}
