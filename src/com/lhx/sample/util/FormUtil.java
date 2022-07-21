package com.lhx.sample.util;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @author luomo
 * @create 2022-07-21 0:42
 */
public class FormUtil {

    public static <T> void formToBean(Map map, T t){
        try {
            BeanUtils.populate(t,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
