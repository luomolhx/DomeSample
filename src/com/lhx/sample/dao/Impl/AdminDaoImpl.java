package com.lhx.sample.dao.Impl;

import com.lhx.sample.bean.User;
import com.lhx.sample.dao.AdminDao;
import com.lhx.sample.util.DruidUtil;
import com.lhx.sample.util.MD5Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

/**
 * @author luomo
 * @create 2022-07-21 0:55
 */
public class AdminDaoImpl implements AdminDao {

    private QueryRunner qr =
            new QueryRunner(DruidUtil.getDataSource());
    @Override
    public User login(User user) {
        //加密密码
        user.setPassword(MD5Util.getMD5(user.getPassword()));
        String sql = "select * from tb_user where username = ?" +
                " and password = ?";
        try {
            user = qr.query(sql,new BeanHandler<>(User.class),
                    user.getUsername(),user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
