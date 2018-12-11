package com.xym.controller.backend;

import com.xym.pojo.Manager;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName ManagerController
 * @Description TODO
 * @Author ak
 * @Date 2018/12/5 下午12:38
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class ManagerController {

    @RequestMapping
    public String main(){
        return "backend/main";
    }

    @RequestMapping("/loginUI")
    public String login(){
        return "backend/login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String login(Manager manager){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(manager.getManagerName(),manager.getPassword());
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return "用户名或密码错误";
        }
        return "success";
    }

    @RequestMapping("/logout")
    @ResponseBody
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "success";
    }

    @RequestMapping("/403")
    public String forbidden(){
        return "backend/403";
    }
}