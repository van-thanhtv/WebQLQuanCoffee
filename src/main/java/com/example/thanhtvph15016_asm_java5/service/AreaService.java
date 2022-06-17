package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.AreaImpl;
import com.example.thanhtvph15016_asm_java5.entity.Area;
import com.example.thanhtvph15016_asm_java5.reposotory.IAreaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class AreaService implements AreaImpl {
    @Autowired
    private IAreaRepository repository;
    @Override
    public List<Area> getAll() {
        return this.repository.findAll();
    }

    @Override
    public Area insert(Area area) {
        area.setId(null);
        return this.repository.save(area);
    }

    @Override
    public Area update(Area area) {
        Integer id = area.getId();
        if (id != null) {
            Optional<Area> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(area);
            }
        }
        return null;
    }

    @Override
    public Area delete(Integer id) {
        if (id != null) {
            Optional<Area> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Area findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public Page<Area> getAllPage(Pageable pageable) {
        return repository.getAllPage(pageable);
    }
}
