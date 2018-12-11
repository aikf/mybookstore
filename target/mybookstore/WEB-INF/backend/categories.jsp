<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/3
  Time: 下午8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有分类</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>
<table id="categories"></table>
</body>
<script type="text/javascript">
    $('#categories').datagrid({
        url:'${bookstore}/admin/aCategories',
        columns:[[
            {field:'name',title:'Code',width:100},
            {field:'description',title:'Name',width:100},
        ]]
    });
</script>
</html>
