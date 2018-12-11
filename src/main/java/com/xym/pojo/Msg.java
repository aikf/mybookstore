package com.xym.pojo;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName Msg
 * @Description TODO 封装处理消息
 * @Author ak
 * @Date 2018/12/2 下午10:11
 * @Version 1.0
 **/
@Data
public class Msg {
    private int code;
    private String message;
    private Map<String, Object> rows = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMessage("处理成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMessage("处理失败");
        return msg;
    }

    public Msg add(String key, Object value){
        this.getRows().put(key, value);
        return this;
    }
}