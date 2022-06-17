package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.WaterType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IWaterTypeRepository extends JpaRepository<WaterType, Integer> {
    @Query("select o from WaterType o")
    Page<WaterType> getAllPage(Pageable pageable);
    WaterType findByNameType(String nameType);
}