package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.WaterTypeImpl;
import com.example.thanhtvph15016_asm_java5.entity.WaterType;
import com.example.thanhtvph15016_asm_java5.reposotory.IWaterTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WaterTypeService implements WaterTypeImpl {
    @Autowired
    private IWaterTypeRepository repository;
    @Override
    public List<WaterType> getAll() {
        return this.repository.findAll();
    }

    @Override
    public WaterType insert(WaterType waterType) {
        waterType.setId(null);
        return this.repository.save(waterType);
    }

    @Override
    public WaterType update(WaterType waterType) {
        Integer id = waterType.getId();
        if (id != null) {
            Optional<WaterType> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(waterType);
            }
        }
        return null;
    }

    @Override
    public WaterType delete(Integer id) {
        if (id != null) {
            Optional<WaterType> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public WaterType findById(Integer id) {
        return this.repository.findById(id).get();
    }

    @Override
    public Page<WaterType> getAllPage(Pageable pageable) {
        return this.repository.getAllPage(pageable);
    }

    @Override
    public WaterType findByNameType(String nameType) {
        try {
            return this.repository.findByNameType(nameType);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
