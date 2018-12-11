package com.xym.service.impl;

import com.xym.dao.ManagerMapper;
import com.xym.pojo.Manager;
import com.xym.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * @ClassName ManagerServiceImpl
 * @Description TODO
 * @Author ak
 * @Date 2018/12/6 下午8:50
 * @Version 1.0
 **/
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    ManagerMapper managerMapper;

    @Override
    public Manager findManager(String managerName) {
        return managerMapper.findManager(managerName);
    }

    @Override
    public Set<String> findRoles(String managerName) {
        return managerMapper.findRoles(managerName);
    }

    @Override
    public Set<String> findPermissions(String managerName) {
        return managerMapper.findPermissions(managerName);
    }
}