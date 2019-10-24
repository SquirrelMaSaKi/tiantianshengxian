package com.rj.service;

import com.rj.pojo.Cart;

import java.util.List;

public interface CartService {
    List<Cart> findByUid(Integer uid);
    void add(Cart cart);
    Cart findByGid(Integer gid);
    void modify(Cart cart);
    void deleteByGid(Integer gid);
}
