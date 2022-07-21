package com.lhx.sample.dao;

import com.lhx.sample.bean.User;

/**
 * @author luomo
 * @create 2022-07-21 0:54
 */
public interface AdminDao {
    User login(User user);
}
