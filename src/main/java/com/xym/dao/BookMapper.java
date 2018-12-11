package com.xym.dao;

import com.xym.pojo.Book;
import com.xym.vo.QueryInfo;

import java.util.List;

public interface BookMapper {
    void addBook(Book book);

    Book findBookById(String id);

    List<Book> findBookByCategory(QueryInfo info);

    Integer getTotalRecord(QueryInfo info);

    List<Book> getAllBook();
}
