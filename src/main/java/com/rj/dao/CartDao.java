package com.rj.dao;

import com.rj.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {
    List<Cart> findByUid(@Param("uid") Integer uid);
    void add(Cart cart);
    Cart findByGid(@Param("gid") Integer gid);
    void modify(Cart cart);
    void deleteByGid(@Param("gid") Integer gid);
}
