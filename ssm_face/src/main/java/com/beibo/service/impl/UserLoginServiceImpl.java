package com.beibo.service.impl;

import com.beibo.mapper.UserLoginMapper;
import com.beibo.pojo.UserLogin;
import com.beibo.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userLoginService")
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    private UserLoginMapper userLoginMapper;

    //登录
    @Override
    public UserLogin checkLogin(String username, String password) {
        UserLogin userLogin = userLoginMapper.findByUsername(username);
        if (userLogin != null && userLogin.getPassword().equals(password)) {
            return userLogin;
        }
        return null;
    }

    //注册
    @Override
    public void Regist(UserLogin userLogin) {
        userLoginMapper.registerByUsernameAndPassword(userLogin.getUsername(), userLogin.getPassword());
    }

    @Override
    public boolean exitsUser(String username) {
        int user = userLoginMapper.exitsUser(username);
        return user == 1 ? true : false;
    }

    @Override
    public UserLogin login(UserLogin userLogin) {
        UserLogin u = userLoginMapper.queryByUserPwd(userLogin.getUsername(), userLogin.getPassword());
        return u;
    }

}
