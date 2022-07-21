package com.lhx.sample.bean;



import lombok.Data;

import java.util.List;

/**
 * @author luomo
 * @create 2022-07-21 0:47
 */

@Data
public class User {
    private String id;
    private String username;
    private String password;
    private String email;
    private String gender;
    private String flag;
    private String role;
    private String code;

    //private List<Order> orders;
}
