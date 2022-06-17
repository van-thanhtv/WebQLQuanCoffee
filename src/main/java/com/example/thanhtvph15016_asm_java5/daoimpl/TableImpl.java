package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.Table;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TableImpl {
    public List<Table> getAll();
    public Table insert(Table table);
    public Table update(Table table);
    public Table delete(Integer id);
    public Table findById(Integer id);
    public Page<Table> getAllPage(Pageable pageable,Integer id);
    public List<Table> getAllByIdArea(Integer IdArea);
}
