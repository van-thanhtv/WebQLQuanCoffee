package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.WaterType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface WaterTypeImpl {
    public List<WaterType> getAll();
    public WaterType insert(WaterType waterType);
    public WaterType update(WaterType waterType);
    public WaterType delete(Integer id);
    public WaterType findById(Integer id);
    public Page<WaterType> getAllPage(Pageable pageable);
    public WaterType findByNameType(String nameType);
}
