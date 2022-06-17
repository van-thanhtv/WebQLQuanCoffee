package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.OrderDetailImpl;
import com.example.thanhtvph15016_asm_java5.entity.OrderDetail;
import com.example.thanhtvph15016_asm_java5.reposotory.IOrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class OrderDetailService implements OrderDetailImpl {
    @Autowired
    private IOrderDetailRepository repository;
    @Override
    public List<OrderDetail> getAll() {
        return this.repository.findAll();
    }

    @Override
    public OrderDetail insert(OrderDetail orderDetail) {
        orderDetail.setId(null);
        return this.repository.save(orderDetail);
    }

    @Override
    public OrderDetail update(OrderDetail orderDetail) {
        Integer id = orderDetail.getId();
        if (id != null) {
            Optional<OrderDetail> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(orderDetail);
            }
        }
        return null;
    }

    @Override
    public OrderDetail delete(Integer id) {
        if (id != null) {
            Optional<OrderDetail> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public OrderDetail findById(Integer id) {
        return this.repository.findById(id).get();
    }

    @Override
    public Page<OrderDetail> getAllPage(Pageable pageable) {
        return this.repository.getAllPage(pageable);
    }
}
