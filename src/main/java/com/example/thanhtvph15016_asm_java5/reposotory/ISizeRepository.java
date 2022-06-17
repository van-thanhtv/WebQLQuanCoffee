package com.example.thanhtvph15016_asm_java5.reposotory;

import com.example.thanhtvph15016_asm_java5.entity.Size;
import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ISizeRepository extends JpaRepository<Size, Integer> {
    @Query("select o from Size o")
    Page<Size> getAllPage(Pageable pageable);
    Size findByNameSize(String nameSize);
}