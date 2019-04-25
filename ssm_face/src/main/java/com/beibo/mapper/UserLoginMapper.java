package com.beibo.mapper;

import com.beibo.pojo.UserLogin;
import org.apache.ibatis.annotations.Param;

public interface UserLoginMapper {

    /**
     * 查找用户名和密码
     *
     * @param username 登录用户名
     * @return
     */
    UserLogin findByUsername(@Param("username") String username);

    /**
     * 注册用户和密码
     */
    void registerByUsernameAndPassword(@Param("username") String username, @Param("password")String password);

    int exitsUser(@Param("username") String username);

    UserLogin queryByUserPwd(@Param("username") String username, @Param("password") String password);
}
