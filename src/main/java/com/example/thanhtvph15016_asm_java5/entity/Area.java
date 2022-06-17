package com.example.thanhtvph15016_asm_java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.persistence.Table;
import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "`area`")
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "max_table")
    private Integer maxTable;

    @Column(name = "status")
    private Integer status;

    @OneToMany(mappedBy = "idArea")
    private List<com.example.thanhtvph15016_asm_java5.entity.Table> listTable;

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

    public Integer getMaxTable() {
        return maxTable;
    }

    public void setMaxTable(Integer maxTable) {
        this.maxTable = maxTable;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", maxTable=" + maxTable +
                ", status=" + status +
                '}';
    }
}