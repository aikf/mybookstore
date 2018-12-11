<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%@include file="../common/base.jspf"%>
</head>
<body style="background-color: #fff3f3;">
    <div class="container">
        <div class="panel panel-default" style="width:380px;height:auto; margin:100px auto;">
            <div class="panel-heading"><strong>爱购图书商城</strong><span style="margin-left:160px;">没有账号？<a href="${bookstore}/registerUI">注册</a></span></div>
            <div id="login" class="panel-body" >
                <form class="form-horizontal" onsubmit="return false;">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="username"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">密码:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="password" >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> 记住我
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" id="in" class="btn btn-default btn-block">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $("#in").click(function () {
        $.ajax({
            url: "${bookstore}/login",
            type: "POST",
            data: $("#login form").serialize(),
            success: function (result) {
                if (result != '') {
                    window.location.href = result;
                }else {
                    alert("用户名或密码错误")
                }
            }
        })
    })
</script>
</body>
</html>
