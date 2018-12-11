package com.xym.db;

import java.lang.annotation.*;

@Target({ElementType.TYPE,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public  @interface DataSourceKey {
    String value() default "";
}
