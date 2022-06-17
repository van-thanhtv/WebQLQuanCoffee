package com.example.thanhtvph15016_asm_java5.model;

import com.example.thanhtvph15016_asm_java5.entity.OrderDetail;
import com.example.thanhtvph15016_asm_java5.entity.Water;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartModel {
    private Water idWater;
    private Integer quantity;
    private OrderDetail idDetail;
}
