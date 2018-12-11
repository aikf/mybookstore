<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书商城首页</title>
    <%@include file="../common/base.jspf"%>
</head>
<body>

<div id="wrapper">
    <!-- 导航条-->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <%--导航条头部标题--%>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${bookstore}/">爱购网上书城</a>
        </div>

        <%--导航条右侧信息--%>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown" id="showCart">
                <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);">
                    购物车<i class="fa fa-shopping-cart fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">


                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    通知<i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-star fa-fw"></i> 收藏的宝贝
                                <span class="pull-right text-muted small">查看</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="${bookstore}/look">
                            <div>
                                <i class="fa fa-search fa-fw"></i> 最近浏览
                                <span class="pull-right text-muted small">查看</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 消息
                                <span class="pull-right text-muted small">查看</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>

                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <c:if test="${sessionScope.user!=null}">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        ${sessionScope.user.username}<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>用户信息</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>修改设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${bookstore}/logout"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.user==null}">
                    <a class="dropdown-toggle" href="${bookstore}/loginUI">
                        登录<i class="fa fa-sign-in fa-fw"></i>
                    </a>
                </c:if>
            </li>
        </ul>

        <%--左侧菜单--%>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <%--查询框--%>
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询书名">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <c:forEach items="${categories}" var="category">
                        <li>
                            <a href="javascript:void(0);" categoriesId="${category.id}">${category.name}</a>
                        </li>
                    </c:forEach>

                </ul>
            </div>

        </div>
    </nav>

    <%--数据显示区--%>
    <div id="page-wrapper" style="padding: 0;">
        <iframe src="${bookstore}/list" name="myFrame" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
    </div>


</div>

<script type="text/javascript">

    // 左侧分类栏 根据所属分类查找图书
    $("#side-menu a").click(function () {
         var id = $(this).attr("categoriesId");
        $("iframe").attr("src","${bookstore}/list?categoryId="+id)
    });

    // 首页动态查看购物车
    $("#showCart").click(function () {
        $.ajax({
            url: "${bookstore}/listCart",
            method: "GET",
            success: function (result) {
                if (result == '') {
                    $("#showCart ul").empty();
                    buildNull();
                    return;
                }
                $("#showCart ul").empty();
                buildListCart(result);
            }
        })
    });

    // 构建购物车列表
    function buildListCart(result) {
        var totalPrice = 0;
        $.each(result, function (index, item) {
            totalPrice += item.price;
            var name = $("<strong></strong>").append(item.book.name);
            var quantity = $("<span></span>").append("&nbsp;&nbsp;"+item.quantity);
            var price = $("<pan></span>").append("&emsp;&emsp;"+item.price);
            var d = $("<div></div>").append(name).append(quantity).append(price);
            var a = $("<a></a>").append(d);
            $("<li></li>").append(a).appendTo($("#showCart ul"));
            $("<li></li>").addClass("divider").appendTo($("#showCart ul"));
        });
        var total = $("<a></a>").addClass("btn").append("总价:&emsp;" + totalPrice);
        var cart = $("<a></a>").attr("href","${bookstore}/cartPage").addClass("btn btn-default").append("查看购物车");
        var div = $("<div></div>").append(total).append(cart);
        $("<li></li>").append(div).appendTo($("#showCart ul"));
    }

    // 购物车为空时
    function buildNull() {
        var p = $("<a></a>").append("购物车为空");
        $("<li></li>").append(p).appendTo($("#showCart ul"));
    }

</script>

</body>
</html>
