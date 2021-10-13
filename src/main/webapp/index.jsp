
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <form action="/getLimit" method="post">
        <table>
            <tr>
                <th>关键词</th>
                <th>
                    <input type="text" name="keyWord" value="${param.keyWord}"/>
                    <input type="hidden" name="pageIndex" value="1" id="pageIndex"/>
                </th>
                <th>
                    <input type="submit" value="查询">
                </th>
            </tr>
        </table>
    </form>
</div>
<div class="container">
    <div class="table-responsive">
        <h1>热点时间排行榜</h1>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>关键词</th>
                <th>热搜指数</th>
                <th>创建时间</th>
            </tr>
            </thead>
            <c:forEach items="${page.list}" var="p">
                <tbody>
                <tr>
                    <td><a href="/toPing/${p.id}" style="text-decoration: none">${p.keyWord}</a>
                    </td>
                    <td>${p.searSum}
                    </td>
                    <td>${p.createDate}
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
    <div class="container">
        <table>
            <tr>
                <th>
                    <a href="javascript:pagc(1)"  style="text-decoration: none">首页</a>
                </th>
                <c:if test="${page.pageIndex>1}">
                    <th>
                        <a href="javascript:pagc(${page.pageIndex-1})"  style="text-decoration: none">上一页</a>
                    </th>
                </c:if>
                <c:if test="${page.pageIndex<page.pageCount}">
                    <th>
                        <a href="javascript:pagc(${page.pageIndex+1})"  style="text-decoration: none">下一页</a>
                    </th>
                </c:if>
                <th><a href="javascript:pagc(${page.pageCount})"  style="text-decoration: none">尾页</a></th>
                <th>第${page.pageIndex}页/共${page.pageCount}页</th>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script>
    function pagc(index) {
        $("#pageIndex").val(index);
        $("form").submit();
    }
</script>
