package com.rj.controller;

import com.rj.pojo.Cart;
import com.rj.pojo.Goods;
import com.rj.pojo.User;
import com.rj.service.CartService;
import com.rj.service.GoodsService;
import com.rj.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiresAuthentication
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;

    @PostMapping("/addCart")
    @ResponseBody
    public Integer addCart(Integer gid, BigDecimal counts, HttpSession session) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsernameOrEmail(username);
        Integer uid = user.getId();
        Cart cart = cartService.findByGidAndUid(gid, uid);
        Goods goods = goodsService.findByGoodId(gid);

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
    public String showCart(HttpServletRequest request, HttpSession session) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        BigDecimal subMoney = new BigDecimal(0);
        User user = userService.findByUsernameOrEmail(username);
        Integer uid = user.getId();
        List<Integer> gids = new ArrayList<>();

        List<Cart> carts = cartService.findByUid(uid);
        request.setAttribute("carts", carts);

        Integer size = cartService.findByUid(uid).size();
        session.setAttribute("size", size);

        for (Cart cart : carts) {
            subMoney = subMoney.add(cart.getMoney());
            gids.add(cart.getGid());
        }
        request.setAttribute("subMoney", subMoney);
        request.setAttribute("gids", gids);

        return "cart";
    }

    @PostMapping("/delete")
    public String deleteCart(Integer gid) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsernameOrEmail(username);
        Integer uid = user.getId();
        cartService.deleteByGidAunUid(gid,uid);
        return "redirect:/cart/showCart";
    }

    @PostMapping("/addCartSql")
    public void addCart2(Integer gid, BigDecimal counts) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsernameOrEmail(username);
        Integer uid = user.getId();
        Goods goods = goodsService.findByGoodId(gid);
        BigDecimal money = counts.multiply(goods.getPrice());
        Cart newCart = new Cart(uid, gid, counts, money);
        cartService.modify(newCart);
    }
}
