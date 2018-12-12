package com.xym.controller.backend;

import com.xym.pojo.Order;
import com.xym.pojo.Orderitem;
import com.xym.pojo.User;
import com.xym.service.BusinessService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Author ak
 * @Date 2018/12/5 上午8:36
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class OrderController {

    @Autowired
    BusinessService service;

    @RequestMapping("/ordersFalseUI")
    public String ordersFalseUI(){
        return "backend/orders";
    }

    @ResponseBody
    @RequestMapping("/ordersFalse")
    public List<Order> ordersFalse(){
        List<Order> orderByState = service.findOrderByState(false);
        return orderByState;
    }

    @RequestMapping("/orderUI/{id}")
    public String orderUI(@PathVariable("id") String id, Model model){
        Order order = service.findOrder(id);
        boolean state = order.isState();
        model.addAttribute("state",state);
        model.addAttribute("id", id);
        return "backend/order";
    }

    @RequestMapping("/order/{id}")
    @ResponseBody
    public Set<Orderitem> order(@PathVariable("id") String id){
        Order order = service.findOrder(id);
        Set<Orderitem> orderitems = order.getOrderitems();
        return orderitems;
    }

    @RequestMapping("/user/{id}")
    @ResponseBody
    public List<User> user(@PathVariable("id") String id){
        Order order = service.findOrder(id);
        User user = order.getUser();
        List<User> u = new ArrayList<>();
        u.add(user);
        return u;
    }

    @ResponseBody
    @RequestMapping("/deliver/{id}")
    public String deliver(@PathVariable("id") String id){
        service.updateOrderState("1",id);
        return "success";
    }

    @RequestMapping("/deliverOrdersUI")
    public String deliverOrdersUI(){
        return "/backend/deliver";
    }

    @RequestMapping("/deliverOrders")
    @ResponseBody
    public List<Order> deliverOrders(){
        List<Order> orderByState = service.findOrderByState(true);
        return orderByState;
    }
}