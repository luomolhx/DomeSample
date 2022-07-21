package com.lhx.sample.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author luomo
 * @create 2022-07-21 0:20
 */
public class DruidUtil {
    //连接池管理
    private static DataSource dataSource;

    //初始化连接池
    static {
        InputStream inputStream =
                DruidUtil.class.getClassLoader().
                getResourceAsStream("db.properties");

        Properties properties = new Properties();
        try {
            properties.load(inputStream);
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //返回连接
    public static Connection getConnection(){
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //返回连接池
    public static DataSource getDataSource(){
        return dataSource;
    }

    //  测试连接是否成功
    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
