package com.lhx.sample.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.rmi.RemoteException;

/**
 * @author luomo
 * @create 2022-07-20 23:26
 */
@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
    //定义私有变量 存放 方法名
    private String methodName;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //获取页面的method参数
        String methodName = request.getParameter("method");
        //获取.class 当前instance
        Class<? extends BaseServlet> clazz = this.getClass();

        try {
            Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (NoSuchMethodException e) {
            throw new RemoteException("您调用的方法" + methodName + "不存在");
        } catch (InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }

    }
}
