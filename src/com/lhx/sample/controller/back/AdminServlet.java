package com.lhx.sample.controller.back;

import cn.hutool.json.JSONUtil;
import com.lhx.sample.bean.ResultVo;
import com.lhx.sample.bean.User;
import com.lhx.sample.controller.BaseServlet;
import com.lhx.sample.service.AdminService;
import com.lhx.sample.service.Impl.AdminServiceImpl;
import com.lhx.sample.util.FormUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author luomo
 * @create 2022-07-21 0:45
 */

@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
    private AdminService adminService =
            new AdminServiceImpl();

    //登录
    public void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单参数
        User user = new User();
        FormUtil.formToBean(request.getParameterMap(), user);
        user = adminService.login(user);
        ResultVo resultVo = new ResultVo();

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            resultVo.setOK(true);
        } else {
            resultVo.setMessage("用户名或密码错误");
        }

        String userJson = JSONUtil.toJsonStr(resultVo);
        System.out.println(userJson);
        response.getWriter().write(userJson);
    }
}
