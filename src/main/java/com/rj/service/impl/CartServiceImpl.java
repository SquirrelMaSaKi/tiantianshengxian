package com.rj.service.impl;

import com.rj.dao.CartDao;
import com.rj.dao.GoodsDao;
import com.rj.pojo.Cart;
import com.rj.pojo.Goods;
import com.rj.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private GoodsDao goodsDao;

    @Override
    public List<Cart> findByUid(Integer uid) {
        List<Cart> carts = cartDao.findByUid(uid);
        for (Cart cart : carts) {
            Goods goods = goodsDao.findByGoodId(cart.getGid());
            cart.setGoods(goods);
        }
        return carts;
    }

    @Override
    public void add(Cart cart) {
        cartDao.add(cart);
    }

    @Override
    public Cart findByGid(Integer gid) {
        return cartDao.findByGid(gid);
    }

    @Override
    public void modify(Cart cart) {
        cartDao.modify(cart);
    }

    @Override
    public void deleteByGid(Integer gid) {
        cartDao.deleteByGid(gid);
    }
}
