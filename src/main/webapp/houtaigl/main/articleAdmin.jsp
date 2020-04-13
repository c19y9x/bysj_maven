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
        table{table-layout: fixed;word-break: break-all; word-wrap: break-word; }
        /*标题行在<td>内只显示一行，多出来的用省略号*/
        .award-name{-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:100%;}
    </style>

    <script>
        window.onload = function () {
            //给第一个下拉菜单绑定离焦事件
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
            //给查询按钮绑定事件
            $("#wz_cx").click(function () {
                var lanmu_id = $("#lm").val();
                var zlanmu_id = $("#zlm").val();
                $("table tr[id!='no_del']").remove();
                //这里因为数据传输问题，所以不传内容过来了，只传标题等
                $.get("htwenzhang1",{lid:lanmu_id,zid:zlanmu_id},function (data) {
                    var list = data;
                    for(var i = 0;i < list.length ;i++){
                        $("table").append("<tr><td><input type=\"checkbox\" name=\"newid\" value='"+list[i].id+"'></td>" +
                            "<td align=\"center\">"+(i+1)+"</td>" +
                            "<td><div class='award-name'>"+list[i].title+"</div></td>" +
                            "<td align=\"center\">"+new Date(list[i].add_time).Format('yy-MM-dd')+"</td>" +
                            "<td><a class=\"btn btn-default btn-sm\" onclick=\"edit_new(this)\" id=\"xj\">修改</a>&nbsp;" +
                            "<a class=\"btn btn-default btn-sm\" onclick=\"del_info(this)\" id=\"del\">删除</a></td></tr>");
                    }
                });
            });
        }

        function del_info(obj){
            if(confirm("您确定要删除吗？")){
                var newid = $(obj).parent().parent().children('td').eq(0).children('input').eq(0).val();
                var lanmu_id = $("#lm").val();
                var zlanmu_id = $("#zlm").val();
                $.get("htwenzhang2",{newid:newid},function (data) {
                    //模拟点击查询按钮
                    document.getElementById("wz_cx").click();
                    alert("已删除");
                })
            }
        }
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

        function edit_new(obj){
            var newid = $(obj).parent().parent().children('td').eq(0).children('input').eq(0).val();
            window.location.href = "${pageContext.request.contextPath}/htwenzhangedit?newid="+newid;
        }

        function add_new(){
            window.location.href = "${pageContext.request.contextPath}/houtaigl/main/articleAdd.jsp";
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
                <select name="zlm" class="form-control" id="zlm">
                    <option value='0'></option>
                </select>
            </div>
            <button type="" class="btn btn-default" id="wz_cx">查询</button>
        </div>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" onclick="add_new()" id="add">添加文章</a>
        <a class="btn btn-primary" onclick="tijiao_news()" id="delSelected">删除选中</a>


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
