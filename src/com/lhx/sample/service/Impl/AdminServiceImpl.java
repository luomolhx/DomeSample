package com.lhx.sample.service.Impl;

import com.lhx.sample.bean.User;
import com.lhx.sample.dao.AdminDao;
import com.lhx.sample.dao.Impl.AdminDaoImpl;
import com.lhx.sample.service.AdminService;

/**
 * @author luomo
 * @create 2022-07-21 0:51
 */
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao = new AdminDaoImpl();

    @Override
    public User login(User user) {
        return adminDao.login(user);
    }
}
