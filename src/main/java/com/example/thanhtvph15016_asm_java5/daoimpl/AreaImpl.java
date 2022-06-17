package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.Area;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface AreaImpl {
    public List<Area> getAll();
    public Area insert(Area area);
    public Area update(Area area);
    public Area delete(Integer id);
    public Area findById(Integer id);
    public Page<Area> getAllPage(Pageable pageable);
}
