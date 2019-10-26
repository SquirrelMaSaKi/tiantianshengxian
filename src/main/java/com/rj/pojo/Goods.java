package com.rj.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Goods implements Serializable {
    private Integer id;
    private Integer typeid;
    private String goodsname;
    private String introduce;
    private BigDecimal price;
    private String company;
    private String subtitle;
    private String img;
    private String imgdetail;
    private Date upshelf;
    private Integer hot;
    private String typename;
}
