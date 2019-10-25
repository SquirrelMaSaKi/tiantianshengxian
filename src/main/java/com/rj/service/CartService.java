package com.rj.service;

import com.rj.pojo.Cart;

import java.util.List;

public interface CartService {
    List<Cart> findByUid(Integer uid);
    void add(Cart cart);
    Cart findByGidAndUid(Integer gid,Integer uid);
    void modify(Cart cart);
    void deleteByGidAunUid(Integer gid, Integer uid);
}
