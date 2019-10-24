package com.rj.controller;

import com.rj.util.Captcha2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class CaptchaController {
    @RequestMapping("/cap")
    public void test3(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException {
        Captcha2.generateCaptcha(req,res);
    }

    @RequestMapping("/checkCode")
    @ResponseBody
    public String checkCode(String code, HttpSession session) {
        String serverCode = (String) session.getAttribute("captcha");
        if (!code.equalsIgnoreCase(serverCode)) {
            return "no";
        } else {
            return "ok";
        }
    }
}
