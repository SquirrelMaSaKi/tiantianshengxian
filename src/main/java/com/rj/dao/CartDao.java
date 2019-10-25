package com.rj.dao;

import com.rj.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {
    List<Cart> findByUid(@Param("uid") Integer uid);
    void add(Cart cart);
    Cart findByGidAndUid(@Param("gid") Integer gid, @Param("uid") Integer uid);
    void modify(Cart cart);
    void deleteByGidAndUid(@Param("gid") Integer gid, @Param("uid") Integer uid);
}
