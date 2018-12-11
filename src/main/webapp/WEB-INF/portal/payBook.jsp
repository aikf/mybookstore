<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付订单</title>
    <%@include file="../common/base.jspf"%>

</head>
<body>
<div class="container">
    <h3>订单明细：</h3>
    <table class="table table-hover">
        <tr>
            <th>书名</th>
            <th>售价</th>
            <th>数量</th>
            <th>小计</th>
        </tr>
        <c:forEach items="${cart.map}" var="item">
            <tr>
                <td>${item.value.book.name}</td>
                <td>${item.value.book.price}</td>
                <td>${item.value.quantity}</td>
                <td>${item.value.price}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td></td>
            <td></td>
            <td>${cart.price}</td>
        </tr>
    </table>
    <h3>收件人信息：</h3>
    <table class="table table-hover">
        <tr>
            <th>用户</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>手机</th>
            <th>地址</th>
        </tr>
            <tr>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.cellphone}</td>
                <td>${user.address}</td>
            </tr>
    </table>
    <div style="float:right;">
        <button class="btn btn-success" id="buy">生成订单(支付)</button>
    </div>
</div>
<script type="text/javascript">
    $("#buy").click(function () {
        $.ajax({
            url: "${bookstore}/payBook",
            method: "GET",
            success: function (result) {
                if (result == "success") {
                    alert("订单已提交，请等待收货！")
                    window.location.href = "${bookstore}/";
                }else {
                    alert("生成订单失败，请稍候再试！")
                }
            }
        })
    })
</script>
</body>
</html>
