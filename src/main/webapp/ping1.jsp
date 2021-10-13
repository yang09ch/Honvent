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
    <h1 id="keyWord"></h1>
    <h4 >创建于：<span id="createDate"></span></h4>
    <p  id="hotContent"></p>
    <input type="hidden" id="id" value="${id}" name="id">
    评论： <div id="div">
    </div>
    <div>
        <table>
            <tr>
                快速评论
                <td>
                    <textarea name="notEventend" id="notEventend"></textarea>
                </td>
                <td>
                    <input type="button" id="bt1" value="提交"  />
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        show();
        $("#bt1").click(function () {
            var id=$("#id").val();
            var notEventend=$("#notEventend").val();
            $.ajax({
                url:"/doadd",
                data:{"hotId":id,"notEventend":notEventend},
                type:"post",
                dataType:"json",
                success:function (result) {
                    if (result[0]!=0){
                        show();
                        $("#notEventend").val("");
                    }
                }
            })/*end*/
        })

    })
    function show() {
        var  id=$("#id").val();
        $.ajax({
            url:"/showPin",
            data:{"id":id},
            dataType:"json",
            success:function (result) {
                $("#keyWord").html(result.keyWord);
                $("#createDate").html(result.createDate);
                $("#hotContent").html(result.hotContent);
                var list=result.commentslist;
                var div="";
                for (var i=0;i<list.length;i++){
                    div+="<p style='background:gray ;width:250px'>评论时间:"+list[i].commentDate+"<br/>"+list[i].notEventend+"</p>"
                }
                $("#div").html(div);
            }
        })/*end*/
    }/*end*/

</script>
