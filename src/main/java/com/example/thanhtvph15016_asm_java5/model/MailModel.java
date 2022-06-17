package com.example.thanhtvph15016_asm_java5.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailModel {
    private String from ="Thanhtvph15016@fpt.edu.vn";
    private String to;
    private String subjet;
    private String body;
    private List<String> cc = new ArrayList<>();
    private List<String> bcc = new ArrayList<>();
    private List<File> files = new ArrayList<>();

    public MailModel(String to, String subjet, String body) {
        this.to = to;
        this.subjet = subjet;
        this.body = body;
    }
}
