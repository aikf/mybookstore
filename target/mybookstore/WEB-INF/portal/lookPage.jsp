<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/11
  Time: 上午8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>足迹</title>
    <%@include file="../common/base.jspf"%>
</head>
<body>
<div class="container">
    <h3>浏览过的宝贝</h3>
    最多显示12本记录 <a href="javascript:void(0);" id="removeCookie" class="btn btn-link"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
        清除足迹</a>
    <br>
<table class="table table-hover">
    <tr>
        <th>图片</th>
        <th>书名</th>
        <th>作者</th>
        <th>售价</th>
        <th>描述</th>
    </tr>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><img src="${bookstore}/files/${book.image}" width="80" /></td>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.price}</td>
            <td>${book.description}</td>
        </tr>
    </c:forEach>
</table>
</div>
<script type="text/javascript">
    $("#removeCookie").click(function () {
        $.ajax({
            url: "${bookstore}/removeCookie",
            method: "GET",
            success: function (result) {
                if (result == "success") {
                    alert("清除成功")
                    window.location.href = "${bookstore}/";
                }
            }
        })
    })
</script>
</body>
</html>
