package com.example.thanhtvph15016_asm_java5.daoimpl;


import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserImpl {
    public List<User> getAll();
    public User insert(User user);
    public User update(User user);
    public User delete(Integer id);
    public User findById(Integer id);
    public User findByEmail(String email);
    public Page<User> getAllPage(Pageable pageable);
    public List<User> search(String terms, int limit, int offset);
}
