package com.xym.dao;

import com.xym.pojo.Category;

import java.util.List;

public interface CategoryMapper {

    void addCategory(Category category);

    Category findCategoryById(String id);

    List<Category> getAllCategory();
}
