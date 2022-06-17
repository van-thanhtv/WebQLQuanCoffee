package com.example.thanhtvph15016_asm_java5.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@javax.persistence.Table(name = "order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_order")
    private Order idOrder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_water")
    private Water idWater;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_table")
    private Table idTable;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "note", length = 200)
    private String note;

    @Column(name = "reason", length = 200)
    private String reason;

    @Column(name = "status")
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(Order idOrder) {
        this.idOrder = idOrder;
    }

    public Water getIdWater() {
        return idWater;
    }

    public void setIdWater(Water idWater) {
        this.idWater = idWater;
    }

    public Table getIdTable() {
        return idTable;
    }

    public void setIdTable(Table idTable) {
        this.idTable = idTable;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}