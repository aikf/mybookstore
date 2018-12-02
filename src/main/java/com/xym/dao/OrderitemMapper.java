package com.xym.dao;

import com.xym.pojo.Orderitem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderitemMapper {
    void addOrderitem(@Param("oi") Orderitem oi, @Param("id") String id);

    List<Orderitem> findItemByOrderId(String id);
}
