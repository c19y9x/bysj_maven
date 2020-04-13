<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/9
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function fanhui() {
            window.location.href = "${pageContext.request.contextPath}/htadmin";
        }
    </script>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改管理员信息</h3>
    <form action="${pageContext.request.contextPath}/htadminupdate" method="post">
        <!--  隐藏域 提交id-->
        <input type="hidden" name="id" value="${admin.id}">

        <div class="form-group">
            <label for="name">管理员id：</label>
            <input type="text" class="form-control" id="name" name="admin_id"  value="${admin.admin_id}" placeholder="请输入姓名" />
        </div>


        <div class="form-group">
            <label for="password">密码：</label>
            <input type="text" class="form-control" value="${admin.password}" id="password"  name="password" placeholder="请输入年龄" />
        </div>

        <div class="form-group">
            <label for="authority">权限控制：</label>
            <select name="authority" id="authority" class="form-control" >
                <c:if test="${admin.authority == 0}">
                    <option value="0" selected>超级管理员</option>
                    <option value="1">学工办</option>
                    <option value="2">教务办</option>
                </c:if>

                <c:if test="${admin.authority == 1}">
                    <option value="0">超级管理员</option>
                    <option value="1" selected>学工办</option>
                    <option value="2">教务办</option>
                </c:if>

                <c:if test="${admin.authority == 2}">
                    <option value="0">超级管理员</option>
                    <option value="1">学工办</option>
                    <option value="2" selected>教务办</option>
                </c:if>
            </select>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回" onclick="fanhui()" />
        </div>
    </form>
</div>
</body>
</html>
