<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/15
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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

    <script>
        //多选删除
        function tijiao_news() {
            if(confirm("您确定要删除吗？")){
                var checkID = [];
                $("input[name='newid']:checked").each(function (i) {
                    checkID[i] = $(this).val();
                });

                $.ajax(
                    {data:{'checkID':checkID},
                        dataType:'text',
                        success: function(data){
                            //模拟点击查询按钮
                            document.getElementById("wz_cx").click();
                            alert("已删除");
                        },
                        type:'post',
                        url:'htwenzhang3',
                        traditional:true
                    }
                );
            }

        }

        function del_info(obj){
            if(confirm("您确定要删除吗？")){
                var logindataid = $(obj).parent().parent().children('td').eq(0).children('input').eq(0).val();
                window.location.href = "${pageContext.request.contextPath}/htadminlogindata1?logindataid=" + logindataid;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">登陆记录</h3>

<%--    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" onclick="tijiao_news()" id="delSelected">删除选中</a>

    </div>--%>

    <br>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th width="25px"><input type="checkbox" id="firstCb"></th>
                <th width="75px">编号</th>
                <th>管理员id</th>
                <th>登陆时间</th>
                <th>登陆ip</th>
                <th width="100px">操作</th>
            </tr>
            <c:forEach items="${logindatas}" var="logindata" varStatus="s">
                <tr>
                    <td width="25px"><input type="checkbox" value="${logindata.id}"></td>
                    <td width="75px">${s.count}</td>
                    <td>${logindata.admin_id}</td>
                    <td><fmt:formatDate value='${logindata.logintime}' type="both" dateStyle="medium" timeStyle="medium"/></td>
                    <td>${logindata.ip}</td>
                    <td width="100px"><a class="btn btn-default btn-sm" id="del" onclick="del_info(this)">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>

</div>
</body>
</html>