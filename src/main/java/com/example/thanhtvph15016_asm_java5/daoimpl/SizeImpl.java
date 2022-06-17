package com.example.thanhtvph15016_asm_java5.daoimpl;

import com.example.thanhtvph15016_asm_java5.entity.Size;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface SizeImpl {
    public List<Size> getAll();
    public Size insert(Size size);
    public Size update(Size size);
    public Size delete(Integer id);
    public Size findById(Integer id);
    public Page<Size> getAllPage(Pageable pageable);
    public Size findByNameSize(String nameSize);
}
