<%--
  Created by IntelliJ IDEA.
  User: YangChuang
  Date: 2021-10-06
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>关键词</th>
        <th>
            <input type="text" name="keyWord" id="keyWord" value=""/>
            <input type="hidden" name="pageIndex" value="1" id="pageIndex"/>
        </th>
        <th>
            <input type="button" value="查询" id="btn1">
        </th>
    </tr>
</table>
<table id="cc">
    <thead>
    <tr>
        <th>关键词</th>
        <th>热搜指数</th>
        <th>创建时间</th>
    </tr>
    </thead>
        <tbody id="tbo">
        </tbody>
</table>
<div id="nva">
    <table id="tb"></table>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        show(1);
        $("#btn1").click(function () {
            show(1);
        })

    })
    function show(pageIndex) {
        var keyWord=$("#keyWord").val();
        $.ajax({
            url:"/getList",
            data:{"keyWord":keyWord,"pageIndex":pageIndex},
            type:"post",
            dataType:"json",
            success:function (result) {
                var str="";
                var list=result.list;
                for (var i=0;i<list.length;i++){
                    str+="<tr>" +
                    "<td><a href='/Ping?id="+list[i].id+"'>"+list[i].keyWord+"</a></td>" +
                    "<td>"+list[i].searSum+"</td>" +
                    "<td>"+list[i].createDate+"</td>" +
                    "</tr>";
                }
                $("#tbo").html(str);
                /*分页*/
                var div="";
                div+="<tr>" +
                    "<td><a href='javascript:show(1)'>首页</a></td>";
                if (result.pageIndex>1){
                    div+="<td><a href='javascript:show("+(parseInt(result.pageIndex)-1)+")'>上一页</a></td>";
                }
                if (result.pageIndex<result.pageCount) {
                    div+="<td><a href='javascript:show("+(parseInt(result.pageIndex)+1)+")'>下一页</a></td>";
                }
                div+="<td>" +
                    "<a href='javascript:show("+result.pageCount+")'>尾页</a></td>";
                div+="<td>第"+result.pageIndex+"页/共"+result.pageCount+"页</td></tr>";
                $("#tb").html(div);

                $("#cc tr:even").css("background","red");
            }
        });/*end*/
    }
</script>
