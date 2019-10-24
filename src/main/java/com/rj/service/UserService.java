package com.rj.service;

import com.rj.pojo.User;

public interface UserService {
    User findByUsernameOrEmail(String ue);
    void add(User user);
}
