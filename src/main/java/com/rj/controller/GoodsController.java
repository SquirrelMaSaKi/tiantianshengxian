package com.rj.controller;

import com.github.pagehelper.PageInfo;
import com.rj.pojo.Goods;
import com.rj.pojo.GoodsType;
import com.rj.service.GoodsService;
import com.rj.service.GoodsTypeService;
import com.rj.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodsTypeService goodsTypeService;


    @GetMapping("/goodDetail")
    public String goodDetail(Integer goodId, HttpServletRequest request) {
        Goods goods = goodsService.findByGoodId(goodId);
        request.setAttribute("goodDetail", goods);
        return "detail";
    }

    @GetMapping("/goodsList")
    public String goodsList(Integer pageNum, Integer pageSize, Integer typeid, String condition, HttpServletRequest request) {
        Integer typeid2 = null;
        String conditionstr = "";

        //处理页码
        int pn = 1;
        int ps = 15;
        if (pageNum == null || pageNum < 1) {
            pn = 1;
        } else {
            pn = pageNum;
        }
        if (pageSize == null || pageSize < 1) {
            ps = 15;
        } else {
            ps = pageSize;
        }

        //处理condition
        if(StringUtil.isEmpty(condition)) {
            conditionstr = "";
        } else if(!condition.equals("price") && !condition.equals("hot")) {
            conditionstr = "%"+condition+"%";
        } else {
            conditionstr = condition;
        }



        //返回结果
        PageInfo<Goods> pageInfo = goodsService.findByPage(pn, ps, typeid, conditionstr);
        List<Goods> goods = pageInfo.getList();
        for (Goods good : goods) {
            typeid2 = good.getTypeid();
            break;
        }
        if (typeid2 != null) {
            GoodsType goodsType = goodsTypeService.findById(typeid2);
            request.setAttribute("pageBean", pageInfo);
            request.setAttribute("typeid", typeid);
            request.setAttribute("typename", goodsType.getTypename());
            request.setAttribute("condition", condition);
        }
        return "list";
    }
}
