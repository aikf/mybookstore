package com.xym.pojo;

import lombok.Data;

import java.util.Date;
import java.util.Set;

/**
 * @ClassName Order
 * @Description 订单实体
 * @Author ak
 * @Date 2018/12/2 上午10:12
 * @Version 1.0
 **/
@Data
public class Order {
    private String id;
    private Date ordertime;
    private boolean state;
    private double price;

    private User user;
    private Set<Orderitem> orderitems;
}