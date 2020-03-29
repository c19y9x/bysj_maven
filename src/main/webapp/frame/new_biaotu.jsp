<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/28
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/my/style.css">
    <link rel="stylesheet" href="../css/my/global.css">
    <link rel="stylesheet" href="../css/my/h5.css">
    <link rel="stylesheet" href="../css/my/nv.css">

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
<div class="container container-fluid no-padding nvbanner">
    <img src="../img/erji/nyba_03.jpg" border="0" />
</div>
<div class="container container-fluid dynava no-padding cleafix">
    <div class="con_wz_lf fl cleafix">
        <h3><span class="windowstyle134775"> 学院新闻</span></h3>
        <div class="nyzct">
            <img src="../img/erji/nylb_03.jpg" border="0" width="192" height="127" />
        </div>
    </div>
    <div class="con_wz_fr fr cleafix">
        <div class="con_bt cleafix">
            <h3 class="fl"><span class="windowstyle134377"> </span></h3>
            <div class="fr">
                <table class="winstyle134378" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td nowrap="">当前位置：
                            <a href="../../index.htm"><span class="fontstyle134378">首页</span></a>
                            <span class="splitflagstyle134378">&gt;&gt;</span><a href="../../jyjx.htm"><span class="fontstyle134378">学院新闻</span></a>
                           <%-- <span class="splitflagstyle134378">&gt;&gt;</span><a href="../xkjs.htm"><span class="fontstyle134378">学科建设</span></a>
                            <span class="splitflagstyle134378">&gt;&gt;</span><a href="zdxk.htm"><span class="fontstyle134378">重点学科</span></a>--%>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div>
            <ul class="wzstar list">

                <c:forEach items="${pb.list}" var="neww" varStatus="n">
                    <li> <a href="${pageContext.request.contextPath}/newServlet?id=${neww.id}" target="_blank" title="学科建设"> ${neww.title}</a><span class="fr"><fmt:formatDate value='${neww.add_time}' pattern='yyyy-MM-dd' /></span></li>

                </c:forEach>
            </ul>
            <div align="center" class="fanye">
                <input type="hidden" name="actiontype" value="" />
                <input type="hidden" name="_scode_" value="1583744064453" />
                <input type="hidden" name="urltype" value="tree.TreeTempUrl" />
                <input type="hidden" name="wbtreeid" value="1217" />
                <input type="hidden" name="outFlag" value="false" />
                <style type="text/css">
                    .headStyle20m3gy1kdc, .headStyle20m3gy1kdc td, .headStyle20m3gy1kdc div {font-size: 12px;font-family:宋体; color: #000000; margin-left: auto; margin-right: auto; line-height:14px;}
                    .defaultButtonStyle {font-size: 12px;font-family:宋体; height:20px;color: #000000;BORDER: #AFD5F5 1px solid; margin: 0px;padding: 0px; FILTER:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff, EndColorStr=#BDDBF7);  CURSOR: pointer; line-height:14px;background:-webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#BDDBF7));background: -moz-linear-gradient( top,#ffffff,#BDDBF7);background:-ms-linear-gradient(top,#ffffff 0%,#bddbf7 100%);}
                    .defaultinputStyle {font-size: 12px;font-family:宋体; height:20px; border:1px solid #AFD5F5; line-height:14px;}
                    .colHeader {font-size: 12px;font-family:宋体; line-height:14px;}
                    .headStyle20m3gy1kdc a, .pageList .this-page {font-size: 12px;font-family:宋体; display:inline-block; height:14px; padding: 2px 4px; border: solid 1px #AFD5F5; background: #fff; text-decoration: none; MARGIN-RIGHT: 1px;line-height:14px;}
                    .headStyle20m3gy1kdc a:visited {font-size: 12px;font-family:宋体; color: #000000; text-decoration: none; line-height:14px;}
                    .headStyle20m3gy1kdc .PrevDisabled {font-size: 12px;font-family:宋体; display:inline-block;height:14px;  margin-right: 3px; padding: 2px 4px; background: #fff;color:#ccc;border: solid 1px #AFD5F5; line-height:14px;}
                    .headStyle20m3gy1kdc .SelectList {font-size: 12px;font-family:宋体;line-height:14px;}
                    .headStyle20m3gy1kdc .Prev { font-size: 12px;font-family:宋体; margin-right: 3px; padding: 2px 4px;line-height:14px;}
                    .headStyle20m3gy1kdc .break {font-size: 12px;font-family:宋体; border: none; text-decoration: none; line-height:14px;}
                    .headStyle20m3gy1kdc .NextDisabled { font-size: 12px;font-family:宋体;display:inline-block; height:14px; margin-left: 2px; padding: 2px 4px;background: #fff;color:#ccc;border: solid 1px #AFD5F5; line-height:14px;}
                    .headStyle20m3gy1kdc .Next { font-size: 12px;font-family:宋体; margin-left: 2px; padding: 2px 4px;line-height:14px;}
                    .headStyle20m3gy1kdc .this-page {font-size: 12px;font-family:宋体;display:inline-block;height:14px;padding: 2px 4px; border: solid 1px #AFD5F5; background: #E1F0FD; font-weight: bold; color:black; MARGIN-RIGHT: 1px;line-height:14px;}
                    .headStyle20m3gy1kdc a:hover {font-size: 12px;font-family:宋体;color: black; background: #EFF7FE; border-color: #AFD5F5; text-decoration: none;line-height:14px;}
                    .headStyle20m3gy1kdc a:link {font-size: 12px;font-family:宋体;color: #000000; text-decoration: none;line-height:14px;}
                    .headStyle20m3gy1kdc a:active { font-size: 12px;font-family:宋体;color: black; text-decoration: none; background: #EFF7FE; line-height:14px;}
                </style>
                <script language="javascript" src="/system/resource/js/gotopage.js"></script>
                <script type="text/javascript">function a134388_gopage_fun(){_simple_list_gotopage_fun(1,'a134388GOPAGE',2)}</script>
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                    <tr>
                        <td colspan="0">
                            <table cellspacing="0" class="headStyle20m3gy1kdc" width="100%" cellpadding="1">
                                <tbody>
                                <tr valign="middle">
                                    <td nowrap="" align="left" width="1%" id="fanye134388">
                                        <div style="margin-top: 3px">
                                            共${pb.totalCount}条&nbsp;&nbsp;${pb.currentPage}/${pb.totalPage}&nbsp;
                                        </div>
                                    </td>
                                    <td nowrap="" align="left">
                                        <div class="btn-group btn-group-xs" role="group" aria-label="...">
                                            <%--<span class="PrevDisabled">首页</span>
                                            <span class="PrevDisabled">上页</span>
                                            <span class="NextDisabled">下页</span>
                                            <span class="NextDisabled">尾页</span>--%>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erijServlet?currentPage=1'">首页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erijServlet?currentPage=${pb.currentPage - 1}'">上页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erijServlet?currentPage=${pb.currentPage + 1}'">下页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erijServlet?currentPage=${pb.totalPage}'">尾页</button>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
