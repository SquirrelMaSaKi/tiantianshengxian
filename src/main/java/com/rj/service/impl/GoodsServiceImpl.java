package com.rj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rj.dao.GoodsDao;
import com.rj.dao.GoodsTypeDao;
import com.rj.pojo.Goods;
import com.rj.pojo.GoodsType;
import com.rj.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private GoodsTypeDao goodsTypeDao;

    @Override
    public List<Goods> findByTypeId(Integer typeId) {
        return goodsDao.findByTypeId(typeId);
    }

    @Override
    public Goods findByGoodId(Integer goodId) {
        Goods goods = goodsDao.findByGoodId(goodId);
        GoodsType goodsType = goodsTypeDao.findById(goods.getTypeid());
        goods.setTypename(goodsType.getTypename());
        return goods;
    }

    @Override
    public PageInfo<Goods> findByPage(Integer pageNum, Integer pageSize, Integer typeid, String condition) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> goodsList = goodsDao.findByTypeIdAndCondition(typeid, condition);
        PageInfo<Goods> pageInfo = PageInfo.of(goodsList);
        return pageInfo;
    }
}
