package com.xym.db;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.aop.MethodBeforeAdvice;

import java.lang.reflect.Method;

/**
 * @ClassName MultipleDataSourceExchange
 * @Description TODO
 * @Author ak
 * @Date 2018/12/7 上午10:40
 * @Version 1.0
 **/
public class MultipleDataSourceExchange implements MethodBeforeAdvice {
    /**
     * 拦截目标方法，获取由@DataSource指定的数据源标识，设置到线程存储中以便切换数据源
     */

    /*public void beforeDaoMethod(JoinPoint point) throws Exception {
        Class<?> target = point.getTarget().getClass();
        MethodSignature signature = (MethodSignature) point.getSignature();
        // 默认使用目标类型的注解，如果没有则使用其实现接口的注解类
        for (Class<?> cls : target.getInterfaces()) {
            resetDataSource(cls, signature.getMethod());
        }
        resetDataSource(target, signature.getMethod());
    }*/

    /**
     * 提取目标对象方法注解和类注解中的数据源标识
     */
    private void resetDataSource(Class<?> cls, Method method) {
        try {
            Class<?>[] types = method.getParameterTypes();
            // 默认使用类注解
            if (cls.isAnnotationPresent(DataSourceKey.class)) {
                DataSourceKey source = cls.getAnnotation(DataSourceKey.class);
                DynamicDataSourceHolder.setRouteKey(source.value());
            }
            // 方法注解可以覆盖类注解
            Method m = cls.getMethod(method.getName(), types);
            if (m != null && m.isAnnotationPresent(DataSourceKey.class)) {
                DataSourceKey source = m.getAnnotation(DataSourceKey.class);
                DynamicDataSourceHolder.setRouteKey(source.value());
            }
        } catch (Exception e) {
            System.out.println(cls + ":" + e.getMessage());
        }
    }

    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        Class<?> target = o.getClass();
        for (Class<?> cls : target.getInterfaces()) {
            resetDataSource(cls, method);
        }
        resetDataSource(target,method);
    }
}