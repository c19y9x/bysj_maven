<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/26
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <!-- <link href="mycss.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="common.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <script src="../js/jquery-1.12.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            setFrmHeight();
        });
        function setFrmHeight() {
            var frm = $(window.parent.document).find("#frm");
            var height = $(document).height();
            frm.height(height);
        }
    </script>
</head>
<body>
<div class="new">
    <div class="new-left">
        <div class="tz-title">
            <span><b>${sy.shouyeContents[0].title} </span>
            <a target="_blank" href="${pageContext.request.contextPath}/erjiServlet?lid=8&zid=3">更多&gt;</a>
        </div>
        <div class="newcon">
            <div class="newcon-left" >
                <iframe width=370px height=328px src="xwgd/gdxw.jsp" frameborder="0" scrolling = "no"></iframe>
            </div>
            <div class="newcon-right" >
                <ul>
                    <c:forEach items="${sy.shouyeContents[0].news}" var="new1" varStatus="n">
                        <li style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" target="_blank">${new1.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="new-right">
        <div class="tz-title">
            <span><b>${sy.shouyeContents[1].title} </span>
            <a target="_blank" href="${pageContext.request.contextPath}/erjiServlet?lid=4&zid=2">更多&gt;</a>
        </div>
        <ul>
                <c:forEach items="${sy.shouyeContents[1].news}" var="new1" varStatus="n">
                    <%--style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"--%>
                    <li><a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" target="_blank">${new1.title}</a></li>
                </c:forEach>
        </ul>
    </div>
</div>

<div class="box3">
    <div class="notic">
        <div class="tz-title">
            <span><b>${sy.shouyeContents[2].title}</b></span>
            <a target="_blank" href="${pageContext.request.contextPath}/erjiServlet?lid=6&zid=3">更多&gt;</a>
        </div>
        <div class="noticlist">
            <ul class="tzlist">
                <c:forEach items="${sy.shouyeContents[2].news}" var="new1" varStatus="n">
                    <%--style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"--%>
                    <li ><span><fmt:formatDate value='${new1.add_time}' pattern='yyyy-MM-dd' /></span><a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" target="_blank" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${new1.title}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="notic">
        <div class="tz-title">
            <span><b>${sy.shouyeContents[3].title}</b></span>
            <a target="_black" href="${pageContext.request.contextPath}/erjiServlet?lid=7">更多&gt;</a>
        </div>
        <ul class="mtlist">
            <c:forEach items="${sy.shouyeContents[3].news}" var="new1" varStatus="n">
                <li style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" target="_blank">${new1.title}</a></li>
            </c:forEach>
        </ul>

    </div>

    <div class="notic lastnotic">
        <div class="tz-title">
            <span><b>${sy.shouyeContents[4].title}</b></span>
            <a target="_blank" href="${pageContext.request.contextPath}/erjiServlet?lid=3">更多&gt;</a>
        </div>
        <div class="noticlist">
            <ul class="tzlist">
                <c:forEach items="${sy.shouyeContents[4].news}" var="new1" varStatus="n">
                    <%--style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"--%>
                    <li >
                        <span><fmt:formatDate value='${new1.add_time}' pattern='yyyy-MM-dd' /></span>
                        <a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" target="_blank" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${new1.title}</a>
                    </li>

                </c:forEach>
            </ul>
        </div>
    </div>

</div>
</body>
</html>
