package com.xym.vo;

import com.xym.pojo.Book;
import lombok.Data;

import java.util.Arrays;
import java.util.List;

/**
 * @ClassName PageInfo
 * @Description TODO 封装数据库查询结果及分页信息
 * @Author ak
 * @Date 2018/12/2 下午3:50
 * @Version 1.0
 **/
@Data
public class PageInfo {

    private List<Book> list;
    private int totalrecord;
    private int pagesize;
    private int totalpage;
    private int currentPage;

    private int previouspage;
    private int nextpage;
    private int[] pagebar;


    public List<Book> getList() {
        return list;
    }
    public void setList(List list) {
        this.list = list;
    }
    public int getTotalrecord() {
        return totalrecord;
    }
    public void setTotalrecord(int totalrecord) {
        this.totalrecord = totalrecord;
    }
    public int getPagesize() {
        return pagesize;
    }
    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }
    public int getTotalpage() {

        if(this.totalrecord%this.pagesize==0){
            this.totalpage = this.totalrecord/this.pagesize;
        }else{
            this.totalpage = this.totalrecord/this.pagesize + 1;//11/3=3...1
        }
        return totalpage;
    }

    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPreviouspage() {
        if(this.currentPage -1>1){   //7-1
            this.previouspage = this.currentPage -1;
        }else{
            this.previouspage = 1;
        }
        return previouspage;
    }

    public int getNextpage() {
        if(this.currentPage +1>this.totalpage){   //7+1
            this.nextpage = this.totalpage;
        }else{
            this.nextpage = this.currentPage +1;
        }
        return nextpage;
    }

    public int[] getPagebar() {

        int startpage;
        int endpage;
//        System.out.println(getTotalpage()); // ??? 加这一行就能正常显示页码条？
        // 大坑！！！totalPage的值只有调用get方法的的时候才会计算
        if(this.getTotalpage()<=10){
            startpage = 1;
            endpage = this.totalpage;
        }else{
            startpage = this.currentPage -4;  //17   13,14,15,16,17,18,19,20,21,22
            endpage = this.currentPage + 5;

            if(startpage<1){
                startpage = 1;
                endpage = 10;
            }
            if(endpage>totalpage){
                endpage = totalpage;
                startpage = totalpage -9;
            }
        }

        this.pagebar = new int[endpage-startpage+1];  //7  1
        int index = 0;
        for(int i=startpage;i<=endpage;i++){
            this.pagebar[index++] = i;
        }
        return pagebar;
    }
}
