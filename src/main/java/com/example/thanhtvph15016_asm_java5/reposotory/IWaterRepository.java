package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.Water;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IWaterRepository extends JpaRepository<Water, Integer> {
    @Query("select o from Water o where o.status =0")
    Page<Water> getAllPage(Pageable pageable);
    @Query("select o from Water o where o.status =0 and o.idType.id=?1")
    Page<Water> findAllByIdType(Integer id,Pageable pageable);
}