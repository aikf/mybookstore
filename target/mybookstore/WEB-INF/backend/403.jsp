<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/7
  Time: 上午6:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提示</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>

<div class="easyui-window" title=" 没有授权" data-options="width:300,height:150,left:20,top:20,inline:true,border:'thin',cls:'c2',iconCls:'icon-no'">
    <p class="w-content" >对不起，您没有权限!</p>
</div>
<script type="text/javascript">
    $('.easyui-window').window({
        collapsible: false,
        minimizable: false,
        maximizable: false,
        closable: false
    });
</script>
<style type="text/css" scoped="scoped">
    .w-content{
        padding:5px 10px;
    }
</style>


</body>
</html>
