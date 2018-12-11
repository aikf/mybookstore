<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 上午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有图书</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>
<table class="easyui-datagrid" title="所有图书" style="width:auto;height:auto"
       data-options="rownumbers:true,singleSelect:true,url:'${bookstore}/admin/aBooks',method:'get',toolbar:'#tb',footer:'#ft'
        ,pagination:true,pageSize:12,pageNumber:2,pageList:[12,24,36]">
    <thead>
    <tr>
        <th data-options="field:'name',width:100">书名</th>
        <th data-options="field:'price',width:80">售价</th>
        <th data-options="field:'author',width:100">作者</th>
        <th data-options="field:'description',width:150">描述</th>
        <th data-options="field:'image',width:200,formatter:rowformatter">图片</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:2px 5px;">
    书名: <input class="easyui-textbox" style="width:110px">
    作者: <input class="easyui-textbox" style="width:110px">
    分类: <input id="cate" name="categoryId">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
</div>
<div id="ft" style="padding:2px 5px;">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
</div>
<div id="w" class="easyui-window" title="查看图片" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;">

</div>
<script type="text/javascript">
    function rowformatter(value, row, index) {
        var url = "${bookstore}/files/" + row.image;
        return "<a href='javascript:openImage(\""+ url +"\")' target='_block'>" + row.image + "</a>";
    }

    function openImage(url){
        $("#w").window({
            content: "<img src='"+ url +"' width='500'/>"
        })
        $("#w").window('open');
    }

    $("#cate").combobox({
        url: '${bookstore}/admin/aCategories',
        valueField: 'id',
        textField: 'name',
        panelHeight: 'auto'

    })
</script>
</body>
</html>
