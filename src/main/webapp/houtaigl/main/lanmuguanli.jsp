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
            $("#lanmu_add_btn").hide();
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
                        $('<td>'+'<input type="checkbox" name="uid" value="' +list[i].id +'">'+'</td>').appendTo($td);
                        var p = list[i];
                        var j = 1;
                        for(var key in p){
                            if(j==1)
                            {
                                j = 2;
                                continue;
                            }
                            $('<td>'+(i+1)+'</td>').appendTo($td);
                            $('<td>'+p[key]+'</td>').appendTo($td);
                        }
                        $('<td>'+'<a class="btn btn-default btn-sm" onclick="update_info(this)" data-toggle="modal" data-target="#myModal" id="xj">修改</a>&nbsp;' +
                            '<a class=\"btn btn-default btn-sm del_lanmu\" onclick=\"del_info(this)\">删除</a>'+'</td>').appendTo($td);
                        $tr.push($td);
                    }
                    for(var j=0;j<$tr.length;j++){
                        $($tr[j]).appendTo($("table"));
                    }
                    //设置只有打开非所有栏目才能添加
                    if(lanmu_cx != 0)
                    {
                        $("#lanmu_add_btn").show();
                    }

                    if(lanmu_cx == 0){
                        //隐藏删除按钮
                        $(".del_lanmu").hide();
                        //隐藏添加栏目按钮
                        $("#lanmu_add_btn").hide();
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
            $("#zlm_id").val(tr1.cells[1].innerText);
            $("#lm_name").val(tr1.cells[2].innerText);
            $("#lm_id").val($("#lanmum").val());
            //法二:Jquery方式
            /*$("#user_id").val($(obj).parent().parent().children('td').eq(1).text());
             $("#user_name").val($(obj).parent().parent().children('td').eq(2).text());*/
        }

        function commit_info()
        {
            var form_data = $("#form_data").serialize();
            //$("#form_data").submit();
            window.location.href="${pageContext.request.contextPath}/htlmedit?"+form_data;

        }
        //add
        function update_info_add() {
            var lanmu_cx = $("#lanmum").val();
            $("#lm_id1").val(lanmu_cx);
        }

        function commit_info_add()
        {
            var form_data = $("#form_data1").serialize();
            //$("#form_data").submit();
            window.location.href="${pageContext.request.contextPath}/htlanmu3?"+form_data;

        }
        //del
        function del_info(obj) {
            if(confirm("宁确定要删除吗？\n" +
                "注意:删除栏目会删除该栏目下的所有文章")){
                var lid = $("#lanmum").val();
                var zid = $(obj).parent().parent().children('td').eq(0).children('input').eq(0).val();
                $.get("htlanmu4",{lid:lid,zid:zid},function (data) {
                    //模拟点击查询按钮
                    document.getElementById("lm_cx").click();
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
    </style>
</head>
<body>

<div class="container">
    <h3 style="text-align: center">栏目管理</h3>

    <div style="float: left;">

        <div class="form-inline">
            <div class="form-group">
                <label for="lanmum">栏目名：</label>
                <select name="lanmum" class="form-control" id="lanmum">
                    <c:if test="${admin.authority == 0}">
                        <c:forEach items="${lms}" var="lanmu" varStatus="s">
                            <c:if test="${s.count == 1}">
                                <option value="0">所有栏目</option>
                            </c:if>
                            <c:if test="${s.count != 1}">
                                <option value="${lanmu.id}">${lanmu.lanmuming}</option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${admin.authority != 0}">
                        <c:forEach items="${lms}" var="lanmu" varStatus="s">
                                <option value="${lanmu.id}">${lanmu.lanmuming}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <button type="" class="btn btn-default" id="lm_cx">查询</button>
        </div>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" data-toggle="modal" data-target="#lanmu_add" id="lanmu_add_btn" onclick="update_info_add()">添加栏目</a>
    </div>

    <br><br>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>栏目名</th>

                <th>操作</th>
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
            <form id="form_data" action="" method="post">
                <div class="modal-body">
                    <input id="lm_id" name="lid" type="hidden" />
                    <input id="zlm_id" name="zid" type="hidden" />
                    栏目名: <input type="text" id="lm_name" name="lanmuming"/>
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

<div class="modal fade" id="lanmu_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="">
                    栏目添加
                </h4>
            </div>
            <form id="form_data1" action="" method="post">
                <div class="modal-body">
                    <input id="lm_id1" name="lid" type="hidden" />
                    栏目名: <input type="text" id="lm_name1" name="lanmuming"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="commit_info_add()" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
