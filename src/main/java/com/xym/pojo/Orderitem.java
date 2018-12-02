package com.xym.pojo;

import lombok.Data;

/**
 * @ClassName Orderitem
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 上午10:15
 * @Version 1.0
 **/
@Data
public class Orderitem {
    private String id;
    private Book book;
    private int quantity;
    private double price;
}