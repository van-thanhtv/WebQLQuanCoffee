package com.example.thanhtvph15016_asm_java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@javax.persistence.Table(name = "`table`")
public class Table {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "location", length = 50)
    private Integer location;

    @Column(name = "status")
    private Integer status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_area")
    private Area idArea;

    @Column(name = "table_group", length = 50)
    private String tableGroup;

    @Column(name = "is_activity")
    private Integer isActivity;

    public Integer getIsActivity() {
        return isActivity;
    }

    public void setIsActivity(Integer isActivity) {
        this.isActivity = isActivity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLocation() {
        return location;
    }

    public void setLocation(Integer location) {
        this.location = location;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Area getIdArea() {
        return idArea;
    }

    public void setIdArea(Area idArea) {
        this.idArea = idArea;
    }

    public String getTableGroup() {
        return tableGroup;
    }

    public void setTableGroup(String tableGroup) {
        this.tableGroup = tableGroup;
    }

    @Override
    public String toString() {
        return "Table{" +
                "id=" + id +
                ", location=" + location +
                ", status=" + status +
                ", tableGroup='" + tableGroup + '\'' +
                ", isActivity=" + isActivity +
                '}';
    }
}