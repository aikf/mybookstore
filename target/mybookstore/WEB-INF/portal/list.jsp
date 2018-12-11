<%--
  Created by IntelliJ IDEA.
  User: ak
  Date: 2018/12/4
  Time: 下午1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示分类图书</title>
    <%@include file="../common/base.jspf"%>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div id="books" style="margin-top: 20px;">
            <c:forEach items="${pageInfo.list}" var="book" varStatus="status">
                <div  class="thumbnail" style="float:left; width: 200px; margin-left:15px;">
                    <img src="${bookstore}/files/${book.image}">
                    <div class="caption">
                        <h5>${book.name}</h5>
                        <p>${book.author}</p>
                        <p>${book.price}</p>
                        <p>${book.description}</p>
                        <p>
                            <a href="${bookstore}/showBook?id=${book.id}" class="btn btn-primary showBook"  role="button">查看</a>
                            <a href="javascript:void(0);" bookId="${book.id}" class="btn btn-default addCart" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>加入购物车</a>
                        </p>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <c:if test="${status.count%6==0}">
                    <div style="clear:both;"></div>
                </c:if>
            </c:forEach>
            <div style="clear:both;"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <nav aria-label="Page navigation" style="padding:0;">
                <ul class="pagination">
                    <c:if test="${pageInfo.currentPage == 1}">
                        <li class="disabled"><a href="javascript:void(0);"><span aria-hidden="true">&laquo;</span></a></li>
                    </c:if>
                    <c:if test="${pageInfo.currentPage != 1}">
                        <li>
                            <a href="${bookstore}/list?currentPage=${pageInfo.previouspage}&categoryId=${categoryId}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.pagebar}" var="bar">
                        <c:if test="${pageInfo.currentPage == bar}">
                        <li class="active">
                            <a href="${bookstore}/list?currentPage=${bar}&categoryId=${categoryId}">${bar}</a>
                        </li>
                        </c:if>
                        <c:if test="${pageInfo.currentPage != bar}">
                            <li>
                                <a href="${bookstore}/list?currentPage=${bar}&categoryId=${categoryId}">${bar}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.currentPage == pageInfo.totalpage}">
                        <li class="disabled"><a href="javascript:void(0)"><span aria-hidden="true">&raquo;</span></a> </li>
                    </c:if>
                    <c:if test="${pageInfo.currentPage != pageInfo.totalpage}">
                    <li>
                        <a href="${bookstore}/list?currentPage=${pageInfo.nextpage}&categoryId=${categoryId}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <div class="col-md-6">
            <%--总共${pageInfo.totalpage}页--%>
            <%--当前${pageInfo.currentpage}页--%>
            <%--总共${pageInfo.totalrecord}条记录--%>
        </div>
    </div>
</div>

<script type="text/javascript">
    // 发送Ajax请求后台加入购物车
    $(".addCart").click(function () {
        var id = $(this).attr("bookId");
        $.ajax({
            url: "${bookstore}/addCart?id="+id,
            method: "GET",
            success: function (result) {
                if (result == "1") {
                    alert("添加成功")
                }else {
                    alert("添加失败")
                }
            }
        })
    })

    $(".showBook").click(function () {

    })
</script>
</body>
</html>
