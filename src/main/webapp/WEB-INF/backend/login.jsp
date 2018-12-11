<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/5
  Time: 下午12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%@include file="../common/head.jspf"%>

</head>
<body>
<div style="margin-top: 100px; margin-left:100px;">
<div class="easyui-panel" title="后台系统登录" style="width:100%;max-width:400px;padding:30px 60px;">
    <form id="ff" method="post">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="managerName" style="width:100%" data-options="label:'用户名:',required:true" >
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:true" >
        </div>
    </form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">登录</a>
    </div>
</div>
</div>
<script>
    function submitForm(){
        $('#ff').form('submit',{
            url: "${bookstore}/admin/login",
            success: function (result) {
                if (result == "success") {
                    alert("登录成功");
                    window.location.href = "${bookstore}/admin/";
                }else {
                    alert(result);
                }
            }
        });
    }

</script>
</body>
</html>
