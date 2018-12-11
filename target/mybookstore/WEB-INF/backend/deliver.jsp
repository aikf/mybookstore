<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/5
  Time: 下午12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已发货订单</title>
    <%@include file="../common/head.jspf"%>
</head>

<body>
<table id="deliverOrders"></table>


<script type="text/javascript">
    $('#deliverOrders').datagrid({
        url:'${bookstore}/admin/deliverOrders',
        columns:[[
            {field:'user',title:'下单客户',width:100,formatter:formatUser},
            {field:'ordertime',title:'下单时间',width:100,formatter: formatDatebox},
            {field:'state',title:'状态',width:100,formatter:formatState},
            {field:'price',title:'订单总价',width:100},
            {field:'id',title:'查看明细',width:100,formatter:formatId},
        ]]
    });

    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, // month
            "d+": this.getDate(), // day
            "h+": this.getHours(), // hour
            "m+": this.getMinutes(), // minute
            "s+": this.getSeconds(), // second
            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
            "S": this.getMilliseconds()
            // millisecond
        }
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "")
                .substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
    function formatDatebox(value) {
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }

        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
    }
    function formatState(value) {
        if (value == '0') {
            return '未发货';
        }else {
            return '已发货';
        }
    }

    function formatUser(value) {
        return value.username;
    }

    function formatId(value) {
        return "<a href='"+ "${bookstore}/admin/orderUI/"+ value +"' >查看</a>"
    }

</script>
</body>
</html>
