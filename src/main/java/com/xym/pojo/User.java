package com.xym.pojo;

import lombok.Data;

/**
 * @ClassName User
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 上午10:16
 * @Version 1.0
 **/
@Data
public class User {
    private String id;
    private String username;
    private String password;
    private String phone;
    private String cellphone;
    private String email;
    private String address;
}