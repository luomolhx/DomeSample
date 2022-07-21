<%--
  Created by IntelliJ IDEA.
  User: 李杭潇
  Date: 2022/7/21
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录页面</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style>
      #main{
      position: absolute;
      width: 400px;
      height: 300px;
      left: 50%;
      top: 40%;
      margin-left: -200px;
      margin-top: -100px;
    }
    </style>
</head>
<body>
    <div id="main" class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title">
                后台登录
            </div>
        </div>
        <div class="panel-body">
            <div style="text-align: center;">
                <img src="/image/mistore_logo.png" alt="logo" width="30%" height="30%">
            </div>
            <div class="form-group">
                <label>用户名:</label>
                <input type="text" name="username" id="username" class="form-control" placeholder=""请输入用户名>
            </div>
            <div class="form-group">
                <label>密&nbsp;&nbsp;&nbsp;码:</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-eye-open" id="eye"></span>
                </span>
            </div>
        </div>
        <div class="form-group" style="text-align: center;">
            <button onclick="login()" class="btn btn-primary">登录</button>
            <button class="btn btn-default">重置</button>
        </div>
    </div>
</body>
    <script src="/js/layerJs/layer.js"></script>
    <script>
        function login(){
            //异步Ajax校验
            $.ajax({
                url : '/AdminServlet?method=adminLogin',
                type : 'post',
                dataType : 'json',
                data : {
                    username : $('#username').val(),
                    password : $('#password').val()
                },
                async : true,

                success : function (data){
                    if (!data.isOK){
                        layer.alert(data.message,{icon : 5});
                    }else {
                        location.href = "/ViewServlet?method=toAdmin";
                    }
                }
            });
        }
    </script>
</html>
