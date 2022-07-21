<%--
  Created by IntelliJ IDEA.
  User: 李杭潇
  Date: 2022/7/20
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax测试页面</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #login_form{
            height: auto;
            width: 500px;
            border: #6cf solid 1px;
            margin-top: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        #message{
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <h1 id="message" style="color: #6cf"></h1>
    <form id="login_form" action="/ajaxServlet?method=login" method="post">
        <div class="input-group">
            <span class="input-group-addon" id="basic_addon_1">用户名:</span>
            <input id="username" type="text" class="form-control" placeholder="请输入您的用户名" aria-describedby="basic_addon_1">
        </div>
        <div class="input-group">
            <span class="input-group-addon" id="basic_addon_2">密&nbsp;&nbsp;&nbsp;码:</span>
            <input id="password" type="password" class="form-control" placeholder="请输入您的密码" aria-describedby="basic_addon_2">
        </div>
        <div class="btn-group btn-group-justified" role="group" aria-label="">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-default">登录</button>
            </div>
        </div>
    </form>
</body>
    <script>
        //blur 失去焦点事件
        $('#username').blur(function (){
            //原生实现ajax技术，比较复杂
            $.ajax({
                url : '/AjaxServlet?method=login',//请求目的地址
                type : 'post',//请求方式
                data : {username : $(this).val()},//要发送的数据
                async : true,//是否异步
                //发送请求成功，并且服务器给客户端返回数据
                success : function (data){
                    $('#message').text(data)
                }
            });
        });
    </script>

</html>
