<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <%@include file="../common/base.jspf"%>

</head>
<body style="background-color: #fff3f3;">
<div class="container">
    <div class="panel panel-default" style="width:380px;height:auto; margin:100px auto;">
        <div class="panel-heading"><strong>
            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 注册表单
        </strong></div>
        <div id="register" class="panel-body" >
            <form class="form-horizontal" method="post" onsubmit="return false;">
                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名:</label>
                    <div class="col-sm-9">
                        <input type="text" id="username" class="form-control" name="username" >
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-3 control-label">密码:</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" class="form-control" name="password" >
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">邮箱:</label>
                    <div class="col-sm-9">
                        <input type="text" id="email" class="form-control" name="email" >
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">手机:</label>
                    <div class="col-sm-9">
                        <input type="text" id="cellphone" class="form-control" name="cellphone" >
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">电话:</label>
                    <div class="col-sm-9">
                        <input type="text" id="phone" class="form-control" name="phone" >
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">地址:</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="address" rows="3" name="address" ></textarea>
                        <span></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <!-- button类型的submit提交表单之后就不在当前页面了 -->
                        <!-- 解决： 在表单form标签中添加onsubmit="return false;" -->
                        <%--<button type="submit" id="done" class="btn btn-default btn-block">注册</button>--%>
                        <input type="submit" id="done" class="btn btn-default btn-block" value="提交" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#done").click(function () {
        // 先调用ajax请求后台的验证
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        // 前台字段正则表达式验证
        if (!validate_form()) {
            return false;
        }

        $.ajax({
            url: "${bookstore}/register",
            type: "POST",
            data: $("#register form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    alert("注册成功");
                    window.location.href="${bookstore}/";
                }else {
                    // 后端校验不通过信息
                    if (undefined != result.rows.e.username) {
                        show_validate_msg("#username", "error", result.rows.e.username)
                    }
                    if (undefined != result.rows.e.password) {
                        show_validate_msg("#password", "error", result.rows.e.password)
                    }
                    if (undefined != result.rows.e.email) {
                        show_validate_msg("#email", "error", result.rows.e.email)
                    }
                    if (undefined != result.rows.e.cellphone) {
                        show_validate_msg("#cellphone", "error", result.rows.e.cellphone)
                    }
                    if (undefined != result.rows.e.phone) {
                        show_validate_msg("#phone", "error", result.rows.e.phone)
                    }
                    if (undefined != result.rows.e.address) {
                        show_validate_msg("#address", "error", result.rows.e.address)
                    }
                }
            }
        });
    });

    // 前台字段正则验证
    function validate_form() {
        // 用户名验证
        var username = $("#username").val();
        var regName = /^[a-zA-Z0-9_-]{4,16}$/;
        if (!regName.test(username)) {
            show_validate_msg("#username","error","用户名是6-16位英文和数字的组合");
        }else {
            show_validate_msg("#username", "success", "");
        }
        // 密码验证
        var password = $("#password").val();
        var regPass = /^[a-zA-Z\d_]{8,}$/;
        if (!regPass.test(password)) {
            show_validate_msg("#password","error","密码必须8位以上字母或数字");
        }else {
            show_validate_msg("#password", "success", "");
        }
        // 验证邮箱
        var email = $("#email").val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email", "error", "不是有效的电子邮箱");
        }else {
            show_validate_msg("#email", "success", "");
        }
        // 验证手机
        var cellphone = $("#cellphone").val();
        var regCell = /^1[34578]\d{9}$/;
        if (!regCell.test(cellphone)) {
            show_validate_msg("#cellphone", "error", "请输入有效手机号");
        }else {
            show_validate_msg("#cellphone", "success", "");
        }
        // 验证电话
        var phone = $("#phone").val();
        var regPhone = /[0-9]{7,8}/;
        if (!regPhone.test(phone)) {
            show_validate_msg("#phone", "error", "电话号码7~8位");
        }else {
            show_validate_msg("#phone", "success", "");
        }
        // 验证地址
        var address = $("#address").val();
        var regAdd = /[\u4e00-\u9fff]{5,}/;
        if (!regAdd.test(address)) {
            show_validate_msg("#address", "error", "地址需要5个以上汉字")
            return false;
        }else {
            show_validate_msg("#address", "success", "");
        }
        // 闯过上面所有关卡后返回true
        return true;
    }

    // 显示验证表单样式
    function show_validate_msg(ele, status, msg){
        $(ele).parent().parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error" == status) {
            $(ele).parent().parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    // 请求后台Ajax查询用户是否存在
    $("#username").change(function () {
        var username = this.value;
        $.ajax({
            url: "${bookstore}/checkUser",
            data: "username=" + username,
            type: "POST",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#username", "success", "用户名可用");
                    $("#done").attr("ajax-va", "success");
                }else {
                    show_validate_msg("#username", "error", result.rows.va_msg);
                    $("#done").attr("ajax-va", "error");
                }
            }
        })
    })

</script>
</body>
</html>
