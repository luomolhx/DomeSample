<%--
  Created by IntelliJ IDEA.
  User: 李杭潇
  Date: 2022/7/21
  Time: 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台主页面</title>
    <mata charset="UTF-8"></mata>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<style>
    @media (min-width: 768px) {
        #left_tab {
            width: 250px;
            position: absolute;
            z-index: 1;
            height: 640px;
        }

        .mysearch {
            margin: 10px;
        }

        .page_main {
            margin-left: 255px;
        }

        .dv_content {
            width: 100%;
            height: 500px;
        }
    }
</style>
<body>
<%--导航--%>
    <div style="width: 80%;margin-left: 10%">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#left_tab,#top_tight">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">网站后台管理</a>
            </div>
            <ul id="top_right" class="collapse navbar-collapse nav navbar-nav navbar-right"	style="margin-right: 20px;">
                <li>
                    <a href="#">
                        <span>欢迎您，【${user.username}】</span>
                    </a>
                </li>
                <li>
                    <a href="/AdminServlet?method=logOut" >
                        <span class="glyphicon glyphicon-off"></span>注销
                    </a>
                </li>
            </ul>
            <!--左侧边栏 -->
            <div id="left_tab" style="margin-top: 70px;" class="collapse navbar-default navbar-collapse">
                <ul class="nav panel-group" id="myPanel">
                    <!--栏目-->
                    <li class="panel">
                        <a href="#sub1" data-toggle="collapse" data-parent="#myPanel"> 用户管理
                            <span class="glyphicon glyphicon-triangle-bottom pull-right"></span>
                        </a>
                        <ul id="sub1" class="nav collapse panel-collapse">
                            <li>
                                <a href="#" id="showUser">
                                    <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<b>会员管理</b>
                                </a>
                            </li>
                            <li>
                                <a href="#" id="invalid"><!-- 无效会员 -->
                                    <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<b>无效会员管理</b>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="panel">
                        <a href="#sub3" data-toggle="collapse" data-parent="#myPanel"> 商品管理
                            <span class="glyphicon glyphicon-triangle-bottom pull-right"></span>
                        </a>
                        <ul id="sub3" class="nav panel-collapse collapse">
                            <li>
                                <a href="#" id="showGoodsType">
                                    <span class="glyphicon glyphicon-record"></span>&nbsp;&nbsp;查看商品分类
                                </a>
                            </li>
                            <li>
                                <a href="#" id="addGoodsType">
                                    <span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;添加商品分类
                                </a>
                            </li>
                            <li>
                                <a href="#" id="showGoods" >
                                    <span class="glyphicon glyphicon-record"></span>&nbsp;&nbsp;查看商品
                                </a>
                            </li>
                            <li>
                                <a href="#" id="addGoods">
                                    <span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;添加商品
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="panel">
                        <a href="#sub2" data-toggle="collapse" data-parent="#myPanel"> 订单管理
                            <span class="glyphicon glyphicon-triangle-bottom pull-right"></span>
                        </a>
                        <ul id="sub2" class="nav panel-collapse collapse">
                            <li>
                                <a href="#" id="showOrder">
                                    <span class="glyphicon glyphicon-record"></span>&nbsp;&nbsp;查看订单
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--右侧部分-->
        <div class="page_main">
            <script type="text/javascript">
                $("#showUser").click(function(){
                    $(".dv_content").attr("src","userList.html");
                })

                $("#invalid").click(function(){
                    $(".dv_content").attr("src","invalidUser.html");
                })

                $("#showGoodsType").click(function(){
                    $(".dv_content").attr("src","showGoodsType.html");
                })
                $("#addGoodsType").click(function(){
                    $(".dv_content").prop("src","addGoodsType.html");
                })
                //查看查询商品菜单连接 prop attr
                $("#showGoods").click(function(){
                    $(".dv_content").prop("src","/xiaomi/viewServlet?method=goShowGoods");
                })
                $("#addGoods").click(function(){
                    $(".dv_content").prop("src","/xiaomi/viewServlet?method=toAddGood");
                })
                $("#showOrder").click(function(){
                    $(".dv_content").attr("src","showAllOrder.html");
                })
            </script>
            <iframe class="dv_content" frameborder="0" scrolling="no">

            </iframe>
        </div>
        </nav>
    </div>
</body>
</html>
