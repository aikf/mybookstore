package com.xym.db;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @ClassName MultipleDataSource
 * @Description TODO
 * @Author ak
 * @Date 2018/12/7 上午10:20
 * @Version 1.0
 **/
public class MultipleDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
        return DynamicDataSourceHolder.getRouteKey();
    }
}