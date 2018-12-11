package com.xym.controller.backend;

import com.xym.pojo.Category;
import com.xym.service.BusinessService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName CategoryController
 * @Description TODO
 * @Author ak
 * @Date 2018/12/2 下午9:24
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class CategoryController {

    @Autowired
    BusinessService businessService;

    @RequestMapping("/addCategoryUI")
    public String addCategoryUI(){
        return "/backend/addCategoryUI";
    }

    @RequestMapping("/addCategory")
    @ResponseBody
    public int addCategory(Category category) throws UnsupportedEncodingException {
        category.setId(UUID.randomUUID().toString());
        category.setName(new String(category.getName().getBytes("iso8859-1"),"utf-8"));
        category.setDescription(new String(category.getDescription().getBytes("iso8859-1"),"utf-8"));
        int i = businessService.addCategory(category);
        return i;
    }

    @RequestMapping("/aCategories")
    @ResponseBody
    public List<Category> aCategories(){
        List<Category> rows = businessService.getAllCategory();
        return rows;
    }

    @RequestMapping("/categories")
    public String categories(){
        return "/backend/categories";
    }

}