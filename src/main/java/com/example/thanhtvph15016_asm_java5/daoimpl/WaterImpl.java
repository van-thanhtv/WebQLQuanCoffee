package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.Water;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface WaterImpl {
    public List<Water> getAll();
    public Water insert(Water water);
    public Water update(Water water);
    public Water delete(Integer id);
    public Water findById(Integer id);
    public Page<Water> getAllPage(Pageable pageable);
    public Page<Water> findAllByIdType(Integer id,Pageable pageable);
}
