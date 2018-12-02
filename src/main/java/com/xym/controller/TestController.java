package com.xym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName TestController
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 上午9:29
 * @Version 1.0
 **/
@Controller
@RequestMapping("/bookstore")
public class TestController {

    @RequestMapping("/test")
    public String test() {
        return "backend/main";
    }
}