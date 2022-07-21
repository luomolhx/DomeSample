package com.lhx.sample.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author luomo
 * @create 2022-07-21 0:29
 */
//MD5加密工具类
public class MD5Util {

    public static String getMD5(String password) {
        //获取信息摘要器
        try {
            MessageDigest digest = MessageDigest.getInstance("md5");
            byte[] result = digest.digest(password.getBytes());
            StringBuffer buffer = new StringBuffer();
            //加盐
            for (byte b : result) {
                int number = b & 0xff;
                String str = Integer.toHexString(number);
                if (str.length() == 1){
                    buffer.append("0");
                }
                buffer.append(str);
            }
            //标准MD5加密后的结果
            return buffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }
}
