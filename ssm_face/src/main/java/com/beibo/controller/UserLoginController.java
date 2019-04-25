package com.beibo.controller;

import com.beibo.pojo.UserLogin;
import com.beibo.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 登录控制器
 */

@Controller
//@RequestMapping("/user")
public class UserLoginController {

    @Autowired
    private UserLoginService userLoginService;

    //访问login.jsp界面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(UserLogin userLogin, Model model, HttpSession session){
//        //调用service方法
//        userLogin = userLoginService.checkLogin(userLogin.getUsername(), userLogin.getPassword());
//        //若有userLogin则添加到model里并且跳转到成功页面
//        if(userLogin != null){
//            //model.addAttribute()往前台传数据
//            model.addAttribute("userLogin",userLogin);
//            return  "redirect:admin/main";
//        }
//        return "login";


        //判断账号是否存在
        boolean exitsUser =  userLoginService.exitsUser(userLogin.getUsername());
        if (exitsUser){
            // 账号存在
            // 密码是否正确
            userLogin = userLoginService.login(userLogin);
            if (userLogin == null){
                //密码错误
                model.addAttribute("errorMsg","密码错误");
                return "login";
            }else {
                //登录成功
                session.setAttribute("userLogin",userLogin);
                return "redirect:admin/main";
            }

        }else {
            //用户不存在
            model.addAttribute("errorMsg","该账号不存在");
            return "login";
        }

    }

    @RequestMapping("/regist")
    public String regist() {
        return "regist";
    }

    @RequestMapping("/doRegist")
    public String doRegist(UserLogin userLogin, Model model) {
//        System.out.println(userLogin.getUsername());
        boolean exitsUser =  userLoginService.exitsUser(userLogin.getUsername());
        if (!exitsUser){
            userLoginService.Regist(userLogin);
            return "login";
        }else {
            model.addAttribute("errorMsg","该账号已存在");
            return "login";
        }
    }


    //注销方法
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }


}
