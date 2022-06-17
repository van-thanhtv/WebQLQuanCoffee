package com.example.thanhtvph15016_asm_java5.config;

import com.example.thanhtvph15016_asm_java5.interceptors.AuthInterceptors;
import com.example.thanhtvph15016_asm_java5.interceptors.StaffInterceptors;
import com.example.thanhtvph15016_asm_java5.interceptors.UserInterceptors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    AuthInterceptors interceptor;

    @Autowired
    UserInterceptors userInterceptors;

    @Autowired
    StaffInterceptors staffInterceptors;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor)
                .addPathPatterns("/user/**","/area/**","/water/**","/table/**","/order/**");
        registry.addInterceptor(userInterceptors)
                .addPathPatterns("/user/**","/area/**","/water/**","/table/**","/order/**")
                .excludePathPatterns("/login");
        registry.addInterceptor(staffInterceptors)
                .addPathPatterns("/user/**","/area/**","/water/**","/table/**")
                .excludePathPatterns("/order/index");
    }
}
