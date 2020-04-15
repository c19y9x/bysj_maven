<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/14
  Time: 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/new_public.css">
    <link rel="stylesheet" href="css/new_style.css">
    <script src="../js/jquery-1.12.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            setFrmHeight();
        });
        function setFrmHeight() {
            var frm = $(window.parent.document).find("#frm1");
            var height = $(document).height();
            frm.height(height);
        }
    </script>
</head>
<body>
<div class="main_one main_five clearfix">
    <div class="main_con">
        <div class="main_list_three_r">
            <div class="title titlea">
                <h2 style="background:url(img/zt_list.jpg) no-repeat 0 50%"><a target="_blank">党政教育</a></h2>

            </div>
            <ul>
                <table align="center" cellspacing="10">
                    <tbody>
                    <tr>
                        <td> <a href="http://www.ccyl.org.cn/" title="中国共青团网" target="_blank"> <img src="img/W020200304504103114926.jpg" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="http://www.qstheory.cn/" title="求是网" target="_blank"> <img src="img/bwcx.png" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="https://www.gov.cn/" title="中国政府网" target="_blank"> <img src="img/wlj.jpg" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="http://www.gmw.cn/" title="光明网" target="_blank"> <img src="img/xxx.jpg" border="0" width="310" height="150" /> </a> </td>
                    </tr>
                    </tbody>
                </table>
            </ul>
        </div>
    </div>
</div>
<div class="main_one main_fore clearfix">
    <div class="main_con">
        <div class="main_list_one main_list_fore">
            <h3><img src="img/icon3.png" /><span class="span spana"> <a target="_blank">联系方式</a></span></h3>
            <ul class="fore_list">
                <li><a href="${pageContext.request.contextPath}/newServlet?id=81&lid=8" target="_blank" title="" style="padding-left:14px;">教务办</a></li>
                <li><a href="${pageContext.request.contextPath}/newServlet?id=81&lid=8" target="_blank" title="" style="padding-left:14px;">学工办</a></li>
                <li><a href="${pageContext.request.contextPath}/newServlet?id=81&lid=8" target="_blank" title="" style="padding-left:15px;">办公室</a></li>
            </ul>
        </div>
        <div class="main_list_one main_list_fore">
            <h3><img src="img/icon4.png" /><span class="span spana"> <a href="index/ggfwpt.htm" target="_blank">快速通道</a></span></h3>
            <ul class="fore_list">
                <li><a href="${pageContext.request.contextPath}/erjiServlet?lid=7&zid=4" target="_blank" title="" style="padding-left:14px;">校友风采</a></li>
                <li><a href="${pageContext.request.contextPath}/newServlet?id=82&lid=2" target="_blank" title="" style="padding-left:14px;">学院简介</a></li>
                <li><a href="${pageContext.request.contextPath}/newServlet?id=83&lid=3" target="_blank" title="" style="padding-left:15px;">精品课程</a></li>
                <li><a href="${pageContext.request.contextPath}/erjiServlet?lid=5&zid=4" target="_blank" title="" style="padding-left:14px;">导师介绍</a></li>
                <li><a href="http://szbwg.jsu.edu.cn/hyy" target="_blank" title="" style="padding-left:14px;">黄永玉博物馆</a></li>
            </ul>
        </div>
        <div class="main_list_one main_list_fore">
            <h3><img src="img/icon5.png" /><span class="span spana"> <a target="_blank">公共服务</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://lib.jsu.edu.cn/" target="_blank" title="" style="padding-left:14px;">校图书馆</a></li>
                <li><a href="https://skxb.jsu.edu.cn/CN/volumn/home.shtml" target="_blank" title="学术期刊" style="padding-left:27px;">学术期刊</a></li>
                <li><a href="http://gxpx1.ceat.edu.cn/" target="_blank" title="中国教育干部网络学院高等教育管理干部培训平台" style="padding-left:15px;">干部培训平台</a></li>
                <li><a href="http://210.43.126.82" target="_blank" title="高校外语教学平台" style="padding-left:14px;">高校外语教学</a></li>

            </ul>
        </div>
        <div class="main_list_one main_list_fore" style="float: right;margin-right: 0px">
            <h3><img src="img/icon6.png" /><span class="span spana"> <a href="index/yqlj.htm" target="_blank">友情链接</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://www.hnedu.cn/index.shtml" target="_blank" title="湖南教育网" style="padding-left:14px;">湖南教育网</a></li>
                <li><a href="http://zwfw-new.hunan.gov.cn/" target="_blank" title="湖南政务服务网" style="padding-left:14px;">湖南政务服务</a></li>
                <li><a href="http://www.hnjy.com.cn/" target="_blank" title="为先在线网" style="padding-left:15px;">为先在线网</a></li>
                <li><a href="http://gov.hnedu.cn/index.shtml" target="_blank" title="湖南教育政务网" style="padding-left:14px;">省教政务</a></li>
                <li><a href="http://www.moe.edu.cn/" target="_blank" title="教育部" style="padding-left:14px;">教育部</a></li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
