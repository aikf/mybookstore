package com.xym.dao;

import com.xym.pojo.Manager;

import java.util.Set;

/**
 * @ClassName ManagerMapper
 * @Description TODO
 * @Author ak
 * @Date 2018/12/6 下午7:03
 * @Version 1.0
 **/
public interface ManagerMapper {

    Manager findManager(String managerName);

    Set<String> findRoles(String managerName);

    Set<String> findPermissions(String managerName);
}