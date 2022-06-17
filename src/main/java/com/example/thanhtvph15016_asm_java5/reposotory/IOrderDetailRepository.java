package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.OrderDetail;
import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IOrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
    @Query("select o from OrderDetail o")
    Page<OrderDetail> getAllPage(Pageable pageable);
}