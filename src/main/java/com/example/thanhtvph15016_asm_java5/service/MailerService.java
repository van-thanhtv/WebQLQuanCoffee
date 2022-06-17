package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.model.MailModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class MailerService {
    @Autowired
    private JavaMailSender sender;
    private List<MimeMessage> queue = new ArrayList<>();

    public void push(String to,String subject,String body){
        MailModel mailModel = new MailModel(to,subject,body);
        this.push(mailModel);
    }
    public void push(MailModel mailModel){
        MimeMessage message = sender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(mailModel.getFrom());
            helper.setTo(mailModel.getTo());
            helper.setSubject(mailModel.getSubjet());
            helper.setText(mailModel.getBody());
            helper.setReplyTo(mailModel.getFrom());
            for (String email : mailModel.getCc()){
                helper.addCc(email);
            }
            for (String email : mailModel.getBcc()){
                helper.addBcc(email);
            }
            for (File file : mailModel.getFiles()){
                helper.addAttachment(file.getName(),file);
            }
            queue.add(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
    @Scheduled(fixedDelay = 10000)
    public void run(){
        int success = 0, error =0;
        while (!queue.isEmpty()){
            MimeMessage message = queue.remove(0);
            try {
                sender.send(message);
                success++;
            }catch (Exception e){
                e.printStackTrace();
                error++;
            }
        }
        System.out.printf("Sent: %d ,Error : %d\r\n",success,error);
    }
}
