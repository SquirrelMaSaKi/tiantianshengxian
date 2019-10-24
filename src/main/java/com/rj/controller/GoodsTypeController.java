package com.rj.controller;

import com.rj.pojo.GoodsType;
import com.rj.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController {
    @Autowired
    private GoodsTypeService goodsTypeService;

    @GetMapping("/typeList")
    //@ResponseBody
    public String typeList(HttpServletRequest request,int id) {
        List<GoodsType> typeList = goodsTypeService.findAll();
        request.setAttribute("typeList", typeList);
        if(id==1) {
            return "typeList";
        } else if(id==2) {
            return "index_listmodel";
        }
        return "redirect:/index.jsp";
    }

    @GetMapping("/type")
    public String type(HttpServletRequest request, Integer typeid) {
        GoodsType type = goodsTypeService.findById(typeid);
        request.setAttribute("type", type);
        return "newGoods";
    }

    @GetMapping("/fenleiheaderDiv")
    public String fenleiheaderDiv() {
        return "fenleiheaderDiv";
    }
}
