package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.OrderImpl;
import com.example.thanhtvph15016_asm_java5.entity.Order;
import com.example.thanhtvph15016_asm_java5.reposotory.IOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class OrderService implements OrderImpl {
    @Autowired
    private IOrderRepository repository;
    @Override
    public List<Order> getAll() {
        return this.repository.findAll();
    }

    @Override
    public Order insert(Order order) {
        order.setId(null);
        return this.repository.save(order);
    }

    @Override
    public Order update(Order order) {
        Integer id = order.getId();
        if (id != null) {
            Optional<Order> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(order);
            }
        }
        return null;
    }

    @Override
    public Order delete(Integer id) {
        if (id != null) {
            Optional<Order> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Order findById(Integer id) {
        return this.repository.findById(id).get();
    }

    @Override
    public Page<Order> getAllPage(Pageable pageable) {
        return this.repository.getAllPage(pageable);
    }

    @Override
    public Order getOrderByTable(Integer idTable) {
        try {
            return this.repository.getOrderByTable(idTable);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Order> getAllOrder() {
        return this.repository.getAllOrder();
    }

    @Override
    public List<Order> getHistoryTable(Integer idTable) {
        try {
            return this.repository.getHistoryTable(idTable);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
