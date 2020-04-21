<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/8
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%--新闻滚动--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="css/site.css" rel="stylesheet" type="text/css" />

    <style>
        .p1{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
    </style>

</head>
<body>
<div class="container mp30" style=" margin-top:10px">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-list-alt"></span><b>滚动公告栏</b></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="demo2">
                                <c:forEach items="${sy.shouyeContents[5].news}" var="new1" varStatus="n">
                                    <li class="news-item"><p class="p1">${new1.title}</p>
                                        <a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}"  target="_top">Read more...</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">

                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $(".demo2").bootstrapNews({
            newsPerPage: 4,
            autoplay: true,
            pauseOnHover: true,
            navigation: false,
            direction: 'down',
            newsTickerInterval: 2500,
            onToDo: function () {
                //console.log(this);
            }
        });
    });

</script>
</html>
