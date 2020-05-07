<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/8
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.12.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".authority").each(function () {
                $(this).text(authIntotext($(this).attr("value")));
            });
        })




        //将权限数字转为文本形式
        function authIntotext(auth) {
            var text;
            switch(Number(auth)) {
                case 0:
                {
                    text = "超级管理员";
                    break;
                }
                case 1:
                {
                    text = "学工办";
                    break;
                }
                case 2:
                {
                    text = "教务办";
                    break;
                }
                default:
                    text = "有问题";
            }
            return text;
        }

        function del_admin(obj) {
            if(confirm("您确定要删除吗？")){
                var adminid = $(obj).parent().parent().children('td').eq(0).children('input').eq(0).val();
                $(obj).parent().parent().remove();
                $.get("htadmin3",{adminid:adminid},function (data) {
                    alert("已删除");
                })
            }
        }
    </script>
    <style>
        table th{
            text-align:center;
        }
        table tr td{
            text-align:center;
        }
        table{table-layout: fixed;word-break: break-all; word-wrap: break-word; }
        /*标题行在<td>内只显示一行，多出来的用省略号*/
        .admin_id{-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:100%;}
    </style>
</head>
<body>

<div class="container">
    <h3 style="text-align: center">管理员管理</h3>

    <div style="float: left;">


    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="houtaigl/admin/adminadd.jsp">添加管理员</a>

    </div>


    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th width="25px" hidden="hidden"><input type="checkbox" id="firstCb"></th>
                <th width="50px">编号</th>
                <th width="200px">管理员id</th>
                <th width="200px">权限</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${admins}" var="admin" varStatus="s">
                <tr>
                    <td hidden="hidden"><input type="checkbox" name="aid" value="${admin.id}"></td>
                    <td>${s.count}</td>
                    <td class="admin_id">${admin.admin_id}<input id="yc_pswd" value="${admin.password}" type="hidden" /></td>
                    <td class="authority" value="${admin.authority}"></td>
                    <td>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/htadminedit?id=${admin.id}" id="xj">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" id="del" onclick="del_admin(this)">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

</div>



</body>
</html>

