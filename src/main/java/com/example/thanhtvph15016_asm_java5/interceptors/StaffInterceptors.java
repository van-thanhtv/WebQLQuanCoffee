package com.example.thanhtvph15016_asm_java5.interceptors;

import com.example.thanhtvph15016_asm_java5.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class StaffInterceptors implements HandlerInterceptor {
    @Autowired
    HttpSession session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) session.getAttribute("sessionUser");
        if (user == null || user.getIsAdmin() == 1) {
            response.sendRedirect("/order/index");
            return false;
        }
        return true;
    }
}
