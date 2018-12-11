package com.xym.pojo;

import lombok.Data;

/**
 * @ClassName Book
 * @Description 图书实体类
 * @Author ak
 * @Date 2018/12/2 上午10:10
 * @Version 1.0
 **/
@Data
public class Book {
    private String id;
    private String name;
    private double price;
    private String author;
    private String image;
    private String description;
    private Category category;
}