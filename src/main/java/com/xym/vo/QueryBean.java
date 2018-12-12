package com.xym.vo;

import lombok.Data;

/**
 * @ClassName QueryBean
 * @Description TODO
 * @Author ak
 * @Date 2018/12/12 上午8:03
 * @Version 1.0
 **/
@Data
public class QueryBean {
    private int page;
    private int rows;
    private String name, author, categoryId, sort, order;
}