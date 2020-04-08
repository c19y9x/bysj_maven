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
        window.onload = function(){
            $("#lm_cx").click(function(){
                //获取选的栏目，以id的形式返回
                var lanmu_cx = $("#lanmum").val();
                //删除不含有属性id = no_del的元素
                $("table tr[id!='no_del']").remove();
                var $tr=[];
                var $td;
                $.get("htlanmuAdmin",{lid:lanmu_cx},function (data) {
                    //判断userExsit键的值是否是true
                    // alert(data);
                    //var span = $("#s_username");
                    var list = data;
                    for(var i = 0;i < list.length ;i++){
                        $td = $('<tr></tr>');
                        $('<td>'+'<input type="checkbox" name="uid" value="' +(i+1) +'">'+'</td>').appendTo($td);
                        var p = list[i];
                        for(var key in p){
                            $('<td>'+p[key]+'</td>').appendTo($td);
                        }
                        $('<td>'+'<a class="btn btn-default btn-sm" onclick="update_info(this)" data-toggle="modal" data-target="#myModal" id="xj">修改</a>&nbsp;<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" id="del">删除</a>'+'</td>').appendTo($td);
                        $tr.push($td);
                    }
                    for(var j=0;j<$tr.length;j++){
                        $($tr[j]).appendTo($("table"));
                    }
                });
            });


        }

        // update
        function update_info(obj)
        {
            // 法一:js方式
            var tr1 = obj.parentNode.parentNode;
            // 赋值
            $("#id").val($(obj).parent().parent().children('td').eq(0).children('input').eq(0).val());
            $("#admin_id").val(tr1.cells[2].innerText);
            $("#password").val($(obj).parent().parent().children('td').eq(2).children('input').eq(0).val());
            //法二:Jquery方式
            /*$("#user_id").val($(obj).parent().parent().children('td').eq(1).text());
             $("#user_name").val($(obj).parent().parent().children('td').eq(2).text());*/
        }

        function commit_info()
        {
            var form_data = $("#form_data").serialize();
            //$("#form_data").submit();
            window.location.href="${pageContext.request.contextPath}/htadmin1?"+form_data;

        }
    </script>
</head>
<body>

<div class="container">
    <h3 style="text-align: center">管理员管理</h3>

    <div style="float: left;">


    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加管理员</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>

    </div>


    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>管理员id</th>

                <th>操作</th>
            </tr>
            <c:forEach items="${admins}" var="admin" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="aid" value="${admin.id}"></td>
                    <td>${s.count}</td>
                    <td>${admin.admin_id}<input id="yc_pswd" value="${admin.password}" type="hidden" /></td>
                    <td>
                        <a class="btn btn-default btn-sm" onclick="update_info(this)" data-toggle="modal" data-target="#myModal" id="xj">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" id="del">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

</div>



<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    管理员管理
                </h4>
            </div>
            <form id="form_data" action="" method="post">
                <div class="modal-body">
                    <input id="id" name="id" type="hidden" />
                    管理员id: <input type="text" id="admin_id" name="admin_id"/>
                    管理员密码: <input type="text" id="password" name="password"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="commit_info()" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>

