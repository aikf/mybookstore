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
<div region="north" style="height:100px;background-color:#E0ECFF;"><h1>图书商城系统后台</h1></div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:180px;">
    <div class="easyui-accordion" data-options="fit:true,border:false">
        <div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
            <a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px">写博客</a>
            <a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
        </div>
        <div title="博客管理" data-options="iconCls:'icon-bkgl'" style="padding:10px;">
            <a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写博客</a>
            <a href="javascript:openTab('博客信息管理','blogManage.jsp','icon-bkgl')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
        </div>
        <div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
            <a href="javascript:openTab('博客类别信息管理','blogTypeManage.jsp','icon-bklb')" class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
        </div>


    </div>
</div>

<div data-options="region:'center'" style="background:#eee;">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页" data-options="iconCls:'icon-home'">
            <div style="padding-top: 50px"><h2 style="margin-left:20px;">欢迎使用</h2></div>
        </div>
    </div>
</div>

<div region="south" style="height:25px;" align="right">design by ak  </div>

<script type="text/javascript">
    /**
     * 打开选项卡
     * @param text  选项卡标题
     * @param url   请求打开路径
     * @param icon  选项卡图标
     */
    function openTab(text,url,icon) {
        //判断当前选项卡是否存在
        if($('#tabs').tabs('exists',text)){
            //如果存在 显示
            $("#tabs").tabs("select",text);
        }else{
            //如果不存在 则新建一个
            $("#tabs").tabs('add',{
                title:text,
                closable:true,      //是否允许选项卡摺叠。
                iconCls:icon,    //显示图标
                content:"<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${myblog}/admin/"+url+"'></iframe>"
                //url 远程加载所打开的url
            })
        }
    }

</script>

</body>
</html>
