<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <%@include file="../common/base.jspf"%>
</head>
<body>
<div class="container">
    <div class="panel panel-success" style="margin-top: 20px;">
        <div class="panel-heading"><h4>购物车</h4></div>
        <div class="panel-body">
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
                <td><strong>${cart.price}</strong></td>
            </tr>
        </table>
        <div style="float:right;">
            <a class="btn btn-success" id="buy" href="${bookstore}/buyBook">提交订单</a>
        </div>
        </div>
    </div>
</div>

</body>
</html>