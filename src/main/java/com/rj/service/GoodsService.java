package com.rj.service;

import com.github.pagehelper.PageInfo;
import com.rj.pojo.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> findByTypeId(Integer typeId);

    Goods findByGoodId(Integer goodId);

    PageInfo<Goods> findByPage(Integer pageNum, Integer pageSize, Integer typeid, String condition);
}
