<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/3
  Time: 下午9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加分类</title>
    <%@include file="../common/head.jspf"%>
</head>
<body>
<div class="easyui-panel" title="添加分类" style="width:100%;max-width:400px;padding:30px 60px;">
    <form id="addCategory" method="post">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'分类名称:',required:true">
        </div>

        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="description" style="width:100%;height:60px" data-options="label:'分类描述:',multiline:true">
        </div>
    </form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清除</a>
    </div>
</div>
<script type="text/javascript">
    function submitForm() {
        $("#addCategory").form('submit',{
            url: '${bookstore}/admin/addCategory',
            method: "POST",
            success: function (result) {
                if(result==1){
                    alert("添加成功");
                    clearForm();
                }else {
                    alert("添加失败")
                }
            }
        });
    }

    function clearForm() {
        $("#addCategory").form('clear');
    }
</script>
</body>
</html>
