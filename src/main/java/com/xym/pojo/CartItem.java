package com.xym.pojo;

import lombok.Data;

/**
 * @ClassName CartItem
 * @Description TODO 购物项
 * @Author ak
 * @Date 2018/12/2 下午4:30
 * @Version 1.0
 **/

public class CartItem {
    private Book book;
    private int quantity;
    private double price;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.price = this.book.getPrice()*quantity;
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

}