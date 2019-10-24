package com.rj.service;

import com.rj.pojo.GoodsType;

import java.util.List;

public interface GoodsTypeService {
    List<GoodsType> findAll();

    GoodsType findById(Integer typeid);
}
