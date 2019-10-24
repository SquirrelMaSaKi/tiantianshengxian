package com.rj.dao;

import com.rj.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    //List<User> findAll();
    User findByUsernameOrEmail(@Param("ue") String ue);
    void add(User user);
}
