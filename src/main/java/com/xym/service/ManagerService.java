package com.xym.service;

import com.xym.pojo.Manager;

import java.util.Set;

public interface ManagerService {
    Manager findManager(String managerName);

    Set<String> findRoles(String managerName);

    Set<String> findPermissions(String managerName);
}
