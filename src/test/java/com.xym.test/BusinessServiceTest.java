package com.xym.test;

import com.xym.dao.ManagerMapper;
import com.xym.pojo.*;
import com.xym.service.BusinessService;
import com.xym.vo.PageInfo;
import com.xym.vo.QueryInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * @ClassName BusinessServiceTest
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 下午5:21
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class BusinessServiceTest {

    @Autowired
    BusinessService businessService;

    @Autowired
    ManagerMapper managerMapper;

    @Test
    public void addCategory(){
        Category category = new Category();
        category.setId("2");
        category.setName("jdbc入门");
        category.setDescription("练好基本功");
        businessService.addCategory(category);
    }

    @Test
    public void findCategory() {
        Category category = businessService.findCategroyById("1");
        System.out.println(category);
    }

    @Test
    public void getAllCategory(){
        List<Category> allCategory = businessService.getAllCategory();
        System.out.println(allCategory);
    }

    @Test
    public void addBook(){
        Category category = businessService.findCategroyById("1");
        Book book = new Book();
        book.setId("2");
        book.setAuthor("小李");
        book.setName("JavaWeb开发");
        book.setPrice(88.8);
        book.setImage("aaa.jpg");
        book.setDescription("aaa");
        book.setCategory(category);
        businessService.addBook(book);
    }

    @Test
    public void findBook(){
        Book book = businessService.findBookById("00eaa7f5-1648-44db-b106-5059c27dd151");
        System.out.println(book);
    }

    @Test
    public void PageQuery(){
        QueryInfo queryInfo = new QueryInfo();
        queryInfo.setCurrentPage(3);
        queryInfo.setPageSize(10);
//        queryInfo.setCategoryId("45633714-fece-43bc-9aa0-7dc02b8405e8");
        PageInfo pageInfo = businessService.pageQuery(queryInfo);
        System.out.println(pageInfo);
    }

    @Test
    public void addUser(){
        User user = new User();
        user.setId("1");
        user.setUsername("ak");
        user.setPassword("123");
        user.setPhone("1388888888");
        user.setCellphone("8222385");
        user.setAddress("xiaoxia");
        user.setEmail("ak@qq.com");
        businessService.addUser(user);
    }

    @Test
    public void findUser(){
        User userById = businessService.findUserById("1");
        System.out.println(userById);
    }

    @Test
    public void saveOrder(){
        User user = businessService.findUserById("1");
        Cart cart = new Cart();

        Category category = businessService.findCategroyById("1");
        Book book = new Book();
        book.setId("2");
        book.setAuthor("小李");
        book.setName("JavaWeb开发");
        book.setPrice(88.8);
        book.setImage("aaa.jpg");
        book.setDescription("aaa");
        book.setCategory(category);

        cart.add(book);
        businessService.saveOrder(cart,user);

    }

    @Test
    public void findOrder(){
        Order order = businessService.findOrder("fa0480ad-d417-4043-9002-f5750a982d23");
        System.out.println(order);
    }

    @Test
    public void findPass(){
//        Manager ak = managerMapper.findManager("ak");
//        System.out.println(ak);
//        Set<String> roles = managerMapper.findRoles("ak");
//        System.out.println(roles);
        Set<String> admin = managerMapper.findPermissions("ak");
        System.out.println(admin);
    }

    @Test
    public void getPass(){
        Md5Hash md5Hash = new Md5Hash("888");
        System.out.println(md5Hash.toString());
    }


}