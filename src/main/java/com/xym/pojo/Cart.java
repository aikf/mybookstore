package com.xym.pojo;

import lombok.Data;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName Cart
 * @Description TODO 购物车
 * @Author ak
 * @Date 2018/12/2 下午4:28
 * @Version 1.0
 **/

public class Cart {

    private Map<String, CartItem> map = new LinkedHashMap<>();
    private double price;

    public void add(Book book) {
        CartItem item = map.get(book.getId());
        if (item == null) {
            item = new CartItem();
            item.setBook(book);
            item.setQuantity(1);
            map.put(book.getId(), item);
        }else {
            item.setQuantity(item.getQuantity()+1);
        }
    }

    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public double getPrice() {
        double totalPrice = 0;
        for (Map.Entry<String, CartItem> entry : map.entrySet()) {
            totalPrice += entry.getValue().getPrice();
        }
        this.price = totalPrice;
        return price;
    }


}