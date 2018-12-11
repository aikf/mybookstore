package com.xym.shiro.realms;

import com.xym.dao.ManagerMapper;
import com.xym.pojo.Manager;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName MyRealm
 * @Description TODO
 * @Author ak
 * @Date 2018/12/6 下午5:44
 * @Version 1.0
 **/
public class MyRealm extends AuthorizingRealm {

    @Autowired
    ManagerMapper managerMapper;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String managerName = (String) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(managerMapper.findRoles(managerName));
        authorizationInfo.setStringPermissions(managerMapper.findPermissions(managerName));

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String managerName = (String) authenticationToken.getPrincipal();
        Manager manager = managerMapper.findManager(managerName);
        if(manager == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(manager.getManagerName(), manager.getPassword(), getName());
        return authenticationInfo;
    }
}