package com.xym.service.impl;

import com.xym.dao.*;
import com.xym.pojo.*;
import com.xym.service.BusinessService;
import com.xym.vo.PageInfo;
import com.xym.vo.QueryInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @ClassName BusinessServiceImpl
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 下午3:18
 * @Version 1.0
 **/
@Service
public class BusinessServiceImpl implements BusinessService {

    @Autowired
    BookMapper bookMapper;
    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderitemMapper orderitemMapper;
    @Autowired
    UserMapper userMapper;


    @Override
    public void addCategory(Category category) {
        categoryMapper.addCategory(category);
    }

    @Override
    public Category findCategroyById(String id) {
        return categoryMapper.findCategoryById(id);
    }

    @Override
    public List<Category> getAllCategory() {
        return categoryMapper.getAllCategory();
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    @Override
    public Book findBookById(String id) {
        return bookMapper.findBookById(id);
    }

    @Override
    public PageInfo pageQuery(QueryInfo info) {
        List<Book> list = bookMapper.findBookByCategory(info);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setList(list);
        pageInfo.setPagesize(info.getPageSize());
        pageInfo.setCurrentpage(info.getCurrentPage());
        pageInfo.setTotalrecord(bookMapper.getTotalRecord(info));
        return pageInfo;
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public User findUserById(String id) {
        return userMapper.findUserById(id);
    }

    @Override
    public User findUserByPassword(String username, String password) {
        return userMapper.findUserByPassword(username, password);
    }

    @Override
    public void saveOrder(Cart cart, User user) {
        Order order = new Order();
        order.setId(UUID.randomUUID().toString());
        order.setOrdertime(new Date());
        order.setPrice(cart.getPrice());
        order.setState(false);
        order.setUser(user);
        orderMapper.addOrder(order);

        Set<Map.Entry<String, CartItem>> entries = cart.getMap().entrySet();
        for (Map.Entry<String, CartItem> entry : entries) {
            CartItem cartItem = entry.getValue();
            Orderitem orderitem = new Orderitem();

            orderitem.setId(UUID.randomUUID().toString());
            orderitem.setBook(cartItem.getBook());
            orderitem.setPrice(cartItem.getPrice());
            orderitem.setQuantity(cartItem.getQuantity());
            orderitemMapper.addOrderitem(orderitem,order.getId());
        }

    }

    @Override
    public Order findOrder(String id) {
        return orderMapper.findOrderById(id);
    }

    @Override
    public List<Order> findOrderByState(boolean state) {
        return orderMapper.findOrderByState(state);
    }
}