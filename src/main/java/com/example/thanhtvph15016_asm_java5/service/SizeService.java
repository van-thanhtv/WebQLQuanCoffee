package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.SizeImpl;
import com.example.thanhtvph15016_asm_java5.entity.Size;
import com.example.thanhtvph15016_asm_java5.reposotory.ISizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SizeService implements SizeImpl {
    @Autowired
    private ISizeRepository repository;

    @Override
    public List<Size> getAll() {
        return this.repository.findAll();
    }

    @Override
    public Size insert(Size size) {
        size.setId(null);
        return this.repository.save(size);
    }

    @Override
    public Size update(Size size) {
        Integer id = size.getId();
        if (id != null) {
            Optional<Size> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(size);
            }
        }
        return null;
    }

    @Override
    public Size delete(Integer id) {
        if (id != null) {
            Optional<Size> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Size findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Page<Size> getAllPage(Pageable pageable) {
        return repository.getAllPage(pageable);
    }

    @Override
    public Size findByNameSize(String nameSize) {
        try {
            return this.repository.findByNameSize(nameSize);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
