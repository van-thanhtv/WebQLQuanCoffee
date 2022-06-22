package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.WaterImpl;
import com.example.thanhtvph15016_asm_java5.entity.Water;
import com.example.thanhtvph15016_asm_java5.reposotory.IWaterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WaterService implements WaterImpl {
    @Autowired
    private IWaterRepository repository;
    @Override
    public List<Water> getAll() {
        return this.repository.findAll();
    }

    @Override
    public Water insert(Water water) {
        water.setId(null);
        return this.repository.save(water);
    }

    @Override
    public Water update(Water water) {
        Integer id = water.getId();
        if (id != null) {
            Optional<Water> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(water);
            }
        }
        return null;
    }

    @Override
    public Water delete(Integer id) {
        if (id != null) {
            Optional<Water> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Water findById(Integer id) {
        return this.repository.findById(id).get();
    }

    @Override
    public Page<Water> getAllPage(Pageable pageable) {
        return this.repository.getAllPage(pageable);
    }

    @Override
    public Page<Water> findAllByIdType(Integer id, Pageable pageable) {
        try {
            return this.repository.findAllByIdType(id,pageable);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
