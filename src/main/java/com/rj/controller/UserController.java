package com.rj.controller;

import com.rj.pojo.User;
import com.rj.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    @ResponseBody
    public String registerLogic(User user) throws IOException {
        userService.add(user);
        return "ok";
    }

    @GetMapping("/check")
    @ResponseBody
    public String check(String ue) {
        User user = userService.findByUsernameOrEmail(ue);
        if (user == null) {
            return "ok";
        }else {
            return "no";
        }
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("login")
    @ResponseBody
    public String loginLogic(String username, String password, String rememberme) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        if (rememberme != null && rememberme.trim().length() != 0) {
            token.setRememberMe(true);
        }
        subject.login(token);
        return "ok";
    }

    @GetMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/index.jsp";
    }

    @GetMapping("/header")
    public String header() {
        return "header";
    }

    @GetMapping("/searchHeader")
    public String searchHeader() {
        return "searchHeader";
    }
}
