package com.rj.resolver;

import com.alibaba.fastjson.JSON;
import com.rj.util.R;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class MyResolver implements HandlerExceptionResolver{
    private Map<Class,String> evMapping=new HashMap();
    private final String DEFAULT_ERROR="error";
    public MyResolver(){
        evMapping.put(UnauthenticatedException.class,"redirect:/user/login");
        evMapping.put(UnauthorizedException.class,"error");
        evMapping.put(IncorrectCredentialsException.class,"json:用户名或密码错误");
        evMapping.put(UnknownAccountException.class,"json:用户名或密码错误");
    }

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView();
        // 开发时必备的
        ex.printStackTrace();
        String view = evMapping.get(ex.getClass());
        if(view == null){
            view = DEFAULT_ERROR;
        }
        mv.setViewName(view);
        if(view.startsWith("json:")){
            //System.out.println("未知账户");
            writeJson(response,view);
            mv=null;
        }
        return mv;
    }

    private void writeJson(HttpServletResponse response,String view){
        response.setContentType("application/json;charset=utf-8");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.print(JSON.toJSON(R.error(view.substring(5))));
        writer.close();
    }
}
