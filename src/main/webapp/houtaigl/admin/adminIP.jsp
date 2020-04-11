<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/10
  Time: 21:51
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

        function tijiao_data() {
            var ip1 = $("#ip_limit1").val();
            var ip2 = $("#ip_limit2").val();
            var reg1 = /^((((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])[;])+)|)$/;
            var reg2 = /^(((((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])|(\*))\.((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])|(\*))\.((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])|(\*))\.(\*)[;])+)|)$/;
            if(reg1.test(ip1)&&reg2.test(ip2))
            {
                return true;
            }
            else if(!reg1.test(ip1)){
                alert("\"单个IP地址控制格式错误\"");
                return false;
            }
            else if(!reg2.test(ip2)){
                alert("\"通配符控制格式错误\"");
                return false;
            }
            return false;
        }
    </script>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">管理员IP限制</h3>
    <form id="form_ip" action="${pageContext.request.contextPath}/htadminIPLimit1" method="post">



<%--        <div class="form-group">
            <label for="authority">IP限制方式：</label>
            <select name="authority" id="authority" class="form-control" >
                <option value="0">单个IP地址</option>
                <option value="1">IP地址区间</option>
                <option value="2">通配符</option>
            </select>
        </div>--%>
        <%
            String ip=request.getRemoteAddr();
            pageContext.setAttribute("ip",ip);
        %>
        <div id="zhushi" style="font-family:KaiTi;font-size: large;color: #0071e7">
            <b>
                本机IP：${ip}<br>
                无区域限制请输入: *.*.*.* 或者什么都不填 <br>
                固定本机请输入:  本机IP<br>
                固定其他电脑请输入其IP: <br>
                <span style="color: red">注意:超级管理员不受IP限制</span>
            </b>
        </div>
        <br><br>
        <div class="form-group">
            <label for="ip_limit1">单个IP地址控制：请输入ip地址，以分号结尾</label>
            <%--<input type="" class="form-control" id="ip_limit" name="ip_limit"  value=""/>--%>
            <textarea rows="3" cols="50" class="form-control" id="ip_limit1" name="ip_limit1" value="">${iPvalues[0].value}</textarea>
        </div>

        <div class="form-group">
            <label for="ip_limit2">通配符控制：请输入带*号的IP地址(最后一位必须为*,前面三位可以是数字也可以是*),以分号结尾</label>
            <%--<input type="" class="form-control" id="ip_limit" name="ip_limit"  value=""/>--%>
            <textarea rows="3" cols="50" class="form-control" id="ip_limit2" name="ip_limit2" value="">${iPvalues[2].value}</textarea>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" onclick="return tijiao_data();"/>
            <input class="btn btn-default" type="reset" value="重置" />
            <%--<input class="btn btn-default" type="button" value="返回" onclick="fanhui()" />--%>
        </div>
    </form>
</div>
</body>
</html>


