<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/5
  Time: 上午10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>
<h3>订单详情：</h3>
<table id="order"></table>
<br>
<h3>收货人信息：</h3>
<table id="user"></table>
<br>
<a href="javascript:void(0)" class="easyui-linkbutton c4" onclick="deliver()" style="width:120px">确认发货</a>
<div id="dlg" class="easyui-dialog" title="对话框" data-options="iconCls:'icon-ok',modal:true,closed:true" style="width:400px;height:200px;padding:10px">
发货成功
</div>

</body>
<script type="text/javascript">
    $('#order').datagrid({
        url:'${bookstore}/admin/order/${id}',
        columns:[[
            {field:'book',title:'书名',width:100,formatter:formatName},
            {field:'sp',title:'售价',width:100,formatter:formatP},
            {field:'quantity',title:'数量',width:100},
            {field:'price',title:'小计',width:100},
        ]]
    });

    function formatName(val) {
        return val.name;
    }
    function formatP(value,row,index) {
        return row.price/row.quantity;
    }

    $('#user').datagrid({
        url:'${bookstore}/admin/user/${id}',
        columns:[[
            {field:'username',title:'用户',width:100},
            {field:'phone',title:'电话',width:100},
            {field:'cellphone',title:'手机',width:100},
            {field:'email',title:'邮箱',width:100},
            {field:'address',title:'地址',width:100},
        ]]
    });

    function deliver() {
        $.ajax({
            url: "${bookstore}/admin/deliver/${id}",
            type: "GET",
            success: function (reslut) {
                if (reslut == "success") {
                    $("#dlg").dialog('open');
                }else {
                    alert("发货失败");
                }
            }
        })
    }
</script>
</html>
