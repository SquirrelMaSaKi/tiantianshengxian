package com.rj.controller;

import com.rj.dao.GoodsDao;
import com.rj.pojo.Cart;
import com.rj.pojo.Goods;
import com.rj.pojo.User;
import com.rj.service.CartService;
import com.rj.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

@Controller
@RequestMapping("/cart")
@RequiresAuthentication
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsDao goodsDao;

    @PostMapping("/addCart")
    @ResponseBody
    public Integer addCart(Integer gid, BigDecimal counts, HttpSession session) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsernameOrEmail(username);
        Integer uid = user.getId();
        Cart cart = cartService.findByGid(gid);
        Goods goods = goodsDao.findByGoodId(gid);

        if (cart == null) {
            BigDecimal money = counts.multiply(goods.getPrice());
            Cart newCart = new Cart(uid, gid, counts, money);
            cartService.add(newCart);
        } else {
            BigDecimal num = cart.getNum().add(counts);
            BigDecimal money = num.multiply(goods.getPrice());
            Cart modCart = new Cart(uid, gid, num, money);
            cartService.modify(modCart);
        }
        Integer size = cartService.findByUid(uid).size();
        session.setAttribute("size", size);
        return size;
    }

    @GetMapping("/showCart")
    public String showCart() {

        return "cart";
    }
}
