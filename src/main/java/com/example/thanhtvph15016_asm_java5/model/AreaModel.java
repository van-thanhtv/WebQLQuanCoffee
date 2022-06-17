package com.example.thanhtvph15016_asm_java5.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AreaModel {
    private int id;
    private String name;
    private Integer maxTable;
    private Integer status;
    private Integer amount;
}
