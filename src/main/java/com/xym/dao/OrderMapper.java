package com.xym.dao;

import com.xym.pojo.Order;

import java.util.List;

public interface OrderMapper {
    void addOrder(Order order);

    Order findOrderById(String id);

    List<Order> findOrderByState(boolean state);
}
