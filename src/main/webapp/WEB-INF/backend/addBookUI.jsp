<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/3
  Time: 下午9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>
<div class="easyui-panel" title="添加分类" style="width:100%;max-width:400px;padding:30px 60px;">
    <form id="addCategory" method="post" enctype="multipart/form-data">
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
            <select class="easyui-combobox" name="category.id" label="所属分类:"  data-options="panelHeight:'auto'" style="width:100%;">
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
    </form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清除</a>
    </div>
</div>
<script type="text/javascript">
    function submitForm() {
        $("#addCategory").form("submit",{
            method: "POST",
            url: "${bookstore}/admin/addBook",
            success: function (result) {
                if(result=="1"){
                    $.messager.show({
                        title:'通知',
                        msg:'添加成功',
                        timeout:2000,
                        showType:'fade'
                    });
                }else{
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

    function clearForm() {
        $("#addCategory").form('clear');
    }
</script>
</body>
</html>
