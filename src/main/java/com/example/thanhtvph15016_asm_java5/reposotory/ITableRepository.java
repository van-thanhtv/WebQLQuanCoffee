package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.Table;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ITableRepository extends JpaRepository<Table, Integer> {
    @Query("select o from Table o where o.idArea.id=?1 ORDER BY o.location ASC")
    Page<Table> getAllPage(Pageable pageable,Integer id);
    @Query("select o from Table o where o.idArea.id=?1 ORDER BY o.location ASC")
    List<Table> getAllByIdArea(Integer IdArea);
}