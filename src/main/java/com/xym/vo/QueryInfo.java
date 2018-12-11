package com.xym.vo;

import lombok.Data;

/**
 * @ClassName QueryInfo
 * @Description TODO 前台传递查询参数封装
 * @Author ak
 * @Date 2018/12/2 上午11:08
 * @Version 1.0
 **/

public class QueryInfo {
    private int currentPage = 1;
    private int startIndex;
    private int pageSize = 12;
    private String categoryId;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        this.startIndex = (this.currentPage-1)*this.pageSize;

    }

    public int getStartIndex() {
        return startIndex;
    }


    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}