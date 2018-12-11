package com.xym.pojo;

import lombok.Data;

import javax.validation.constraints.Pattern;

/**
 * @ClassName User
 * @Description TODO 前台用户
 * @Author ak
 * @Date 2018/12/2 上午10:16
 * @Version 1.0
 **/
@Data
public class User {
    private String id;
    @Pattern(regexp = "^[a-zA-Z0-9_-]{4,16}$", message = "用户名是6-16位英文和数字的组合!")
    private String username;
    @Pattern(regexp = "^[a-zA-Z\\d_]{8,}$", message = "密码必须8位以上字母或数字!")
    private String password;
    @Pattern(regexp = "[0-9]{7,8}" ,message = "电话号码7~8位!")
    private String phone;
    @Pattern(regexp = "^1[34578]\\d{9}$", message = "请输入有效手机号!")
    private String cellphone;
    @Pattern(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", message = "不是有效的电子邮箱!")
    private String email;
    @Pattern(regexp = "[\\u4e00-\\u9fff]{5,}", message = "地址需要5个以上汉字!")
    private String address;
}