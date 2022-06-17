package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.Area;
import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IAreaRepository extends JpaRepository<Area, Integer> {
    @Query("select o from Area o")
    Page<Area> getAllPage(Pageable pageable);
    @Query("select o from Area o where o.status=0")
    List<Area> findAll();
}