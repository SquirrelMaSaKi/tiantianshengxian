package com.rj.dao;

import com.rj.pojo.GoodsType;

import java.util.List;

public interface GoodsTypeDao {
    List<GoodsType> findAll();

    GoodsType findById(Integer typeid);
}
