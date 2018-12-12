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
<table id="dg" class="easyui-datagrid" title="所有图书" style="width:auto;height:auto"
       data-options="rownumbers:true,singleSelect:true,url:'${bookstore}/admin/aBooks',method:'get',toolbar:'#tb',footer:'#ft'
        ,pagination:true,fit:true,pageSize:10,pageNumber:1,pageList:[5,10,15,20]">
    <thead>
    <tr>
        <th data-options="field:'name',width:150,sortable:true">书名</th>
        <th data-options="field:'price',width:80,sortable:true">售价</th>
        <th data-options="field:'author',width:80,sortable:true">作者</th>
        <th data-options="field:'description',width:150">描述</th>
        <th data-options="field:'image',width:300,formatter:rowformatter">图片</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:2px 5px;">
    书名: <input id="name" class="easyui-textbox" name="name" style="width:110px">
    作者: <input id="author" class="easyui-textbox" name="author" style="width:110px">
    分类: <input id="cate" name="categoryId">
    <a href="javascript:void(0);" onclick="submitForm()" class="easyui-linkbutton" iconCls="icon-search">查询</a>
    <a href="javascript:void(0);" onclick="clearForm()" class="easyui-linkbutton" iconCls="icon-clear">清除</a>
</div>
<div id="ft" style="padding:2px 5px;">
    <a href="javascript:void(0)" onclick="addBook()" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
    <a href="javascript:void(0)" onclick="editBook()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
    <a href="javascript:void(0)" onclick="removeBook()" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
</div>
<div id="w" class="easyui-window" title="查看图片" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;">

    <div id="dlg" class="easyui-dialog" style="width:400px;height:auto;padding:10px 20px"
         closed="true" buttons="#dlg-buttons">
        <form id="book" method="post" enctype="multipart/form-data">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'书名:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="author" style="width:100%" data-options="label:'作者:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="price" style="width:100%" data-options="label:'售价:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-filebox"  name="file" style="width:100%" data-options="label:'图片上传:'">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="description" style="width:100%;height:60px" data-options="label:'分类描述:',multiline:true">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-combobox" name="categoryId" style="width:100%;" data-options="label:'分类:',valueField:'id',textField:'name',panelHeight:'auto',url:'${bookstore}/admin/aCategories'" >
            </div>
        </form>

    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveBook()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>

</div>
<script type="text/javascript">
    // 格式化单元格
    function rowformatter(value, row, index) {
        var url = "${bookstore}/files/" + row.image;
        return "<a href='javascript:openImage(\""+ url +"\")' target='_block'>" + row.image + "</a>";
    }

    // 打开图片对话框
    function openImage(url){
        $("#w").window({
            content: "<img src='"+ url +"' width='500'/>"
        });
        $("#w").window('open');
    }

    // 加载分类信息
    $("#cate").combobox({
        url: '${bookstore}/admin/aCategories',
        valueField: 'id',
        textField: 'name',
        panelHeight: 'auto'

    });


    //发送查询参数
    function submitForm() {
        var name = $("#name").val();
        var author = $("#author").val();
        var cate = $("#cate").val();
        // var cate = $("#cate").combobox("getText");
        // alert(name + author + cate);
        $("#dg").datagrid({
            queryParams: {name:name,author:author,categoryId:cate}
        })
    }
    // 清空查询参数
    function clearForm() {
        $("#tb").form("clear");
    }

    // 弹出添加对话框
    function addBook() {
        // 打开表单对话框
        $("#dlg").dialog("open");
        // 清空原有的表单数据
        $("#book").form("clear");
        $("#dlg").dialog("setTitle", "添加图书");
    }

    // 提交保存
    function saveBook() {
        $("#book").form("submit",{
            url: '${bookstore}/admin/addBook',
            success: function (result) {
                if (result == "1") {
                    // 成功后关闭对话框
                    $("#dlg").dialog("close");
                    // 并刷新数据网格
                    $("#dg").datagrid("reload");
                    $.messager.show({
                        title:'通知',
                        msg:'添加成功',
                        timeout:2000,
                        showType:'fade'
                    });
                }else {
                    $.messager.show({
                        title:'通知',
                        msg:'添加失败',
                        timeout:2000,
                        showType:'fade'
                    });
                }
            }
        })
    }

    // 弹出修改对话框
    function editBook() {
        var row = $("#dg").datagrid("getSelected");
        if(row){
            $("#dlg").dialog("open");
            $("#book").form("load", row);
            $("#dlg").dialog("setTitle","修改图书");
        }else {
            $.messager.show({
                title:'通知',
                msg:'必须选中一行',
                timeout:2000,
                showType:'fade'
            });
        }
    }

    // todo 后台请求更新

    // 删除图书
    function removeBook() {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除确认','您确认要删除吗？',function (r) {
                // 确认删除后 调用Ajax请求后端删除
                if (r) {
                    $.ajax({
                        url: '', // todo 后台请求删除
                        data: {id: row.id},
                        success: function (result) {

                        }
                    })
                }
            })
        }else {
            $.messager.show({
                title:'通知',
                msg:'必须选中一行',
                timeout:2000,
                showType:'fade'
            });
        }
    }
</script>
</body>
</html>
