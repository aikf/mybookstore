package com.xym.service;

import com.xym.db.DataSourceKey;
import com.xym.pojo.*;
import com.xym.vo.PageInfo;
import com.xym.vo.QueryInfo;

import java.util.List;

public interface BusinessService {

    int addCategory(Category category);

    Category findCategroyById(String  id);

    List<Category> getAllCategory();

    void addBook(Book book);

    Book findBookById(String id);

    List<Book> getAllBook();

    PageInfo pageQuery(QueryInfo info);

    void addUser(User user);

    User findUserById(String id);

    User findUserByUsername(String username);

    User findUserByPassword(String username, String password);

    void saveOrder(Cart cart, User user);

    Order findOrder(String id);

    List<Order> findOrderByState(boolean state);

    void updateOrderState(String state, String id);


}
