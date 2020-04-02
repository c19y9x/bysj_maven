<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/1
  Time: 20:21
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
                var lanmu_cx = $("#lanmum").val();
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

            $("#lm_cz").click(function (){
                var s = $("table tr[id!='no_del']").size();
                alert(s);
            });
            // update表单
            function update_info(obj)
            {
                // 法一:js方式
                var tr1 = obj.parentNode.parentNode;
                // 赋值
                $("#user_id").val(tr1.cells[1].innerText);
                $("#user_name").val(tr1.cells[2].innerText);
                //法二:Jquery方式
               /*$("#user_id").val($(obj).parent().parent().children('td').eq(1).text());
                $("#user_name").val($(obj).parent().parent().children('td').eq(2).text());*/
            }

            function add_info()
            {
                var form_data = $("#form_data").serialize();
                window.location.href="${pageContext.request.contextPath}/shouye";
                //alert(form_data);
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h3 style="text-align: center">栏目管理</h3>

    <div style="float: left;">

        <div class="form-inline">
            <div class="form-group">
                <label for="lanmum">栏目名：</label>
                <select name="lanmum" class="form-control" id="lanmum">
                    <c:forEach items="${lms}" var="lanmu" varStatus="s">
                        <c:if test="${s.count == 1}">
                            <option value="1">所有栏目</option>
                        </c:if>
                        <c:if test="${s.count != 1}">
                            <option value="${lanmu.id}">${lanmu.lanmuming}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <button type="" class="btn btn-default" id="lm_cx">查询</button>
            <button type="" class="btn btn-default" id="lm_cz">重置</button>
        </div>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加栏目</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>

    </div>


    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>栏目名</th>

                <th>操作</th>
            </tr>

            <tr id="wait_del">
                <td><input type="checkbox" name="uid" value="${user.id}"></td>
                <td>1</td>
                <td>试一下</td>
                <td><a class="btn btn-default btn-sm" onclick="update_info(this)" data-toggle="modal" data-target="#myModal" id="xj">修改</a>&nbsp;
                    <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" id="del">删除</a>
                </td>
            </tr>
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
                    栏目管理
                </h4>
            </div>
            <form id="form_data">
                <div class="modal-body">
                    栏目名: <input type="text" id="user_name" name="user_name"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="add_info()" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
