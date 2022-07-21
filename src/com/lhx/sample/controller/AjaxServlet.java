package com.lhx.sample.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author luomo
 * @create 2022-07-20 16:44
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends BaseServlet{
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.write("用户名不正确");
    }
}
