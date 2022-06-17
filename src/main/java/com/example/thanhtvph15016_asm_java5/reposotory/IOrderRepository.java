package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.Order;
import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IOrderRepository extends JpaRepository<Order, Integer> {
    @Query("select o from Order o")
    Page<Order> getAllPage(Pageable pageable);
    @Query("select o from Order o where o.status=0")
    List<Order> getAllOrder();
    @Query("SELECT o FROM Order o \n" +
            "JOIN OrderDetail od ON o.id = od.idOrder.id\n" +
            "WHERE o.status=0 AND od.idTable.id=?1")
    Order getOrderByTable(Integer idTable);
    @Query("SELECT DISTINCT(o)  FROM Order o \n" +
            "JOIN OrderDetail od ON o.id = od.idOrder.id\n" +
            "WHERE DATE(o.dateOrder) = CURDATE() AND od.idTable.id=?1")
    List<Order> getHistoryTable(Integer idTable);
}