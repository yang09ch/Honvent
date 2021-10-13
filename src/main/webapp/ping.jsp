<%--
  Created by IntelliJ IDEA.
  User: YangChuang
  Date: 2021-10-08
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <h1>${ho.keyWord}</h1>
    <h4>创建于：${ho.createDate}</h4>
    <p>${ho.hotContent}</p>
    <div>评论：
        <c:forEach items="${co}" var="d">
            <table>
                <tr>
                    <td>评论时间:${d.commentDate}</td>
                </tr>
                <tr>
                    <td>${d.notEventend}</td>
                </tr>
            </table>
        </c:forEach>
    </div>
    <div>
        <table>
            <tr>
                快速评论
                <td>
                    <textarea name="notEventend"></textarea>
                </td>
                <td>
                    <input type="submit" />
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
