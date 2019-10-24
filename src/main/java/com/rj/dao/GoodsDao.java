package com.rj.dao;

import com.rj.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDao {
    List<Goods> findByTypeId(@Param("typeId") Integer typeId);

    Goods findByGoodId(@Param("goodId") Integer goodId);

    List<Goods> findByTypeIdAndCondition(@Param("typeid") Integer typeid, @Param("condition") String condition);
}
