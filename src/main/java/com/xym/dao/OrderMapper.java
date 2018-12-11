package com.xym.dao;

import com.xym.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    void addOrder(Order order);

    Order findOrderById(String id);

    List<Order> findOrderByState(boolean state);

    void updateOrderState(@Param("state") String state, @Param("id") String id);
}
