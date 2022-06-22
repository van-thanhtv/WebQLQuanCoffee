package com.example.thanhtvph15016_asm_java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.FullTextFilterDef;
import org.springframework.stereotype.Indexed;

import javax.persistence.*;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.sql.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Indexed
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotBlank(message = "Can't be left blank name !")
    @Field
    @Column(name = "name", length = 100)
    private String name;

    @NotBlank(message = "Can't be left blank phone !")
    @Field
    @Column(name = "phone", length = 15)
    private String phone;

    @Column(name = "birthday")
    private Date birthday;

    @NotBlank(message = "Can't be left blank address !")
    @Field
    @Column(name = "address", length = 100)
    private String address;

    @Column(name = "sex")
    private Integer sex;

    @Column(name = "image", length = 150)
    private String image;

    @Email(message = "Your email is not valid !")
    @NotBlank(message = "Can't be left blank email !")
    @Column(name = "email", nullable = false, length = 50)
    private String email;

    @NotBlank(message = "Can't be left blank password !")
    @Column(name = "password", length = 200)
    private String password;

    @Column(name = "status")
    private Integer status;

    @Column(name = "isAdmin")
    private Integer isAdmin;

    public Integer getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Integer isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}