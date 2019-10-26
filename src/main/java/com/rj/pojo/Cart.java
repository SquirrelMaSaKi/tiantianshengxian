package com.rj.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart implements Serializable {
    private Integer uid;
    private Integer gid;
    private BigDecimal num;
    private BigDecimal money;
    private Goods goods;

    public Cart(Integer uid, Integer gid, BigDecimal num, BigDecimal money) {
        this.uid = uid;
        this.gid = gid;
        this.num = num;
        this.money = money;
    }
}
