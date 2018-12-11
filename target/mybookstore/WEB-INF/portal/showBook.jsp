<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/11
  Time: 上午8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看图书</title>
    <%@include file="../common/base.jspf"%>
</head>
<body>
<div class="container">
    <div>
        <img src="${bookstore}/files/${book.image}"><br>
        ${book.name}<br>
        ${book.author}<br>
        ${book.price}<br>
        ${book.description}
    </div>
</div>
</body>
</html>
