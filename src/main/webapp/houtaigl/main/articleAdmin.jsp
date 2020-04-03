<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/3
  Time: 17:50
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
    <%--控制表格表头行字体居中显示--%>
    <style>
        table th{
            text-align:center;
        }
    </style>

    <script>
        window.onload = function () {
            $("#lm").blur(function () {
                var lanmu_cx = $("#lm").val();
                $("select[id='zlm'] option").remove();
                //htwenzhang1用于处理根据第一个下拉菜单的栏目获取子栏目显示在第二个下拉菜单中
                $.get("htlanmuAdmin",{lid:lanmu_cx},function (data) {
                    var list = data;
                    for(var i = 0;i < list.length ;i++){
                        if(lanmu_cx == 1)
                        {
                            $("#zlm").append("<option value='0'></option>");break;
                        }
                        else
                            $("#zlm").append("<option value='"+ (i+1) +"'>"+list[i].zlmname +"</option>");
                    }
                });
            });
            $("#wz_cx").click(function () {
                var lanmu_id = $("#lm").val();
                var zlanmu_id = $("#zlm").val();
                //这里因为数据传输问题，所以不传内容过来了，只传标题等
                $.get("htwenzhang1",{lid:lanmu_id,zid:zlanmu_id},function (data) {
                    var list = data;
                    alert(1);
                    for(var i = 0;i < list.length ;i++){
                        $("table").append("<tr><td><input type=\"checkbox\" name=\"uid\" value="+list[i].id+"</td>" +
                            "<td>"+(i+1)+"</td>" +
                            "<td>"+list[i].title+"</td>" +
                            "<td>"+new Date(list[i].add_time).Format('yy-MM-dd')+"</td>" +
                            "<td><a class=\"btn btn-default btn-sm\" onclick=\"update_info(this)\" data-toggle=\"modal\" data-target=\"#myModal\" id=\"xj\">修改</a>&nbsp;" +
                            "<a class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\" id=\"del\">删除</a></td></tr>");
                    }
                })
            });
        }
        //时间戳转换函数
        //使用方法:new Date(1542274800000).Format('yy-MM-dd hh:mm:ss');
        //格式根据自己的需求改动
        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, // 月份
                "d+": this.getDate(), // 日
                "h+": this.getHours(), // 小时
                "m+": this.getMinutes(), // 分
                "s+": this.getSeconds(), // 秒
                "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
                "S": this.getMilliseconds() // 毫秒
            };
            if (/(y+)/.test(fmt))
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + ""));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">文章管理</h3>

    <div style="float: left;">

        <div class="form-inline">
            <div class="form-group">
                <label for="lm">文章位置：</label>
                <select name="lanmum" class="form-control" id="lm">
                    <c:forEach items="${lms}" var="lanmu" varStatus="s">
                        <c:if test="${s.count == 1}">
                            <option value="1">所有栏目</option>
                        </c:if>
                        <c:if test="${s.count != 1}">
                            <option value="${lanmu.id}">${lanmu.lanmuming}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <select name="zlm" class="form-control" id="zlm">

                </select>
            </div>
            <button type="" class="btn btn-default" id="wz_cx">查询</button>
        </div>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加栏目</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>

    </div>


    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover" id="my_table">
            <tr class="success" id="no_del">
                <th width="25px"><input type="checkbox" id="firstCb" ></th>
                <th width="50px">编号</th>
                <th width="700px">标题</th>
                <th>添加时间</th>
                <th >操作</th>
            </tr>
        </table>
    </form>

</div>

</body>
</html>
