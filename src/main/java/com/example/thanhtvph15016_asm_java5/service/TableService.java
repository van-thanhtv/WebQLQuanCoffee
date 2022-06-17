package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.TableImpl;
import com.example.thanhtvph15016_asm_java5.entity.Area;
import com.example.thanhtvph15016_asm_java5.entity.Table;
import com.example.thanhtvph15016_asm_java5.reposotory.ITableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class TableService implements TableImpl {
    @Autowired
    private ITableRepository repository;

    @Override
    public List<Table> getAll() {
        return this.repository.findAll();
    }

    @Override
    public Table insert(Table table) {
        table.setId(null);
        return this.repository.save(table);
    }

    @Override
    public Table update(Table table) {
        Integer id = table.getId();
        if (id != null) {
            Optional<Table> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(table);
            }
        }
        return null;
    }

    @Override
    public Table delete(Integer id) {
        if (id != null) {
            Optional<Table> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public Table findById(Integer id) {
        return this.repository.findById(id).get();
    }

    @Override
    public Page<Table> getAllPage(Pageable pageable,Integer id) {
        return repository.getAllPage(pageable,id);
    }

    @Override
    public List<Table> getAllByIdArea(Integer IdArea) {
        try {
            return this.repository.getAllByIdArea(IdArea);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
