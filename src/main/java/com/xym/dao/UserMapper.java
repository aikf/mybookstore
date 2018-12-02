package com.xym.dao;

import com.xym.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    void addUser(User user);

    User findUserById(String id);

    User findUserByPassword(@Param("username") String username, @Param("password") String password);

}
