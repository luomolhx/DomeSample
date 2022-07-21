package com.lhx.sample.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author luomo
 * @create 2022-07-21 2:02
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends BaseServlet{
    //跳转到后台首页
    public void toAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/admin.jsp").forward(req,resp);
    }
}
