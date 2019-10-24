package com.rj.service.impl;

import com.rj.dao.GoodsDao;
import com.rj.dao.GoodsTypeDao;
import com.rj.pojo.Goods;
import com.rj.pojo.GoodsType;
import com.rj.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService {
    @Autowired
    private GoodsTypeDao goodsTypeDao;
    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<GoodsType> findAll() {
        List<GoodsType> goodsTypes = goodsTypeDao.findAll();
        for (GoodsType goodsType : goodsTypes) {
            List<Goods> goods = goodsDao.findByTypeId(goodsType.getId());
            goodsType.setGoods(goods);
        }
        return goodsTypes;
    }

    @Override
    public GoodsType findById(Integer typeid) {
        GoodsType type = goodsTypeDao.findById(typeid);
        List<Goods> goods = goodsDao.findByTypeId(typeid);
        type.setGoods(goods);
        return type;
    }
}
