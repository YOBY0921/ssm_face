package com.beibo.service;

import com.beibo.pojo.UserLogin;

import javax.servlet.http.HttpSession;

public interface UserLoginService {

   UserLogin checkLogin(String username, String password);

    void Regist(UserLogin userLogin);

    boolean exitsUser(String username);

    UserLogin login(UserLogin userLogin);
}
