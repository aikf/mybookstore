<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/2
  Time: 上午9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统后台</title>
    <%@include file="../common/head.jspf"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mycss.css">
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;">
    <p style="float:left;margin-left:20px;font-size:20px;">爱购商城管理系统</p>
    <a href="javascript:void(0);" onclick="logout();" style="float:right;" class="easyui-linkbutton c4" data-options="iconCls:'icon-back'">退出</a>
</div>
<div data-options="region:'west',split:true,title:'功能菜单'" style="width:200px;">

    <div id="aa" class="easyui-accordion" data-options="fit:false" style="width:300px;height:200px;">
        <div title="分类管理" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:15px;">
            <a href="javascript:open('${bookstore}/admin/addCategoryUI','添加分类')" class="easyui-linkbutton" data-options="plain:true,width:150">添加分类</a>
            <a href="javascript:open('${bookstore}/admin/categories','查看分类')" class="easyui-linkbutton" data-options="plain:true,width:150">查看分类</a>
        </div>
        <div title="图书管理" data-options="iconCls:'icon-reload'" style="padding:15px;">
            <a href="javascript:open('${bookstore}/admin/addBookUI','添加图书')" class="easyui-linkbutton" data-options="plain:true,width:150">添加图书</a>
            <a href="javascript:open('${bookstore}/admin/books','查看图书')" class="easyui-linkbutton" data-options="plain:true,width:150">查看图书</a>
        </div>
        <div title="订单管理" data-options="iconCls:'icon-ok'" style="padding:15px;">
            <a href="javascript:open('${bookstore}/admin/ordersFalseUI','待处理订单')" class="easyui-linkbutton" data-options="plain:true,width:150">待处理订单</a>
            <a href="javascript:open('${bookstore}/admin/deliverOrdersUI','已发货订单')" class="easyui-linkbutton" data-options="plain:true,width:150">已发货订单</a>
        </div>
        <%--<div title="数据库管理" data-options="iconCls:'icon-ok'" style="padding:15px;">
            <a href="javascript:open('${bookstore}/admin/ordersFalseUI','待处理订单')" class="easyui-linkbutton" data-options="plain:true,width:150">数据库备份</a>
            <a href="javascript:open('${bookstore}/admin/deliverOrdersUI','已发货订单')" class="easyui-linkbutton" data-options="plain:true,width:150">数据恢复</a>
        </div>--%>
    </div>

</div>
<div data-options="region:'east',split:true,collapsed:true,title:'工具栏'" style="width:100px;padding:10px;">

</div>
<div data-options="region:'south',border:false" style="height:30px;background:#A9FACD;line-height: 30px;" align="center">@COPY RIGHT AK 2018</div>
<div data-options="region:'center',title:'主面板'">

    <div class="easyui-tabs" id="tab1" data-options="fit:true,closable:true" style="width:100%;height:250px">
        <div title="欢迎" style="padding:10px">
            <p>欢迎使用，上次登录时间为：</p>
        </div>
    </div>

</div>
<script type="text/javascript">
    function open(url,title) {
        if($("#tab1").tabs("exists",title)){
           $("#tab1").tabs("select",title);
        }else{
            $("#tab1").tabs("add",{
                title: title,
                closable: true,
                content: "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='"+url+"'></iframe>"
            })
        }
    }

    function logout() {
        $.ajax({
            url: "${bookstore}/admin/logout",
            success: function (result) {
                if (result == "success") {
                    window.location.href = "${bookstore}/admin"
                }
            }
        })
    }
</script>
</body>
</html>
