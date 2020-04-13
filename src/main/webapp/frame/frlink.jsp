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
                <h2 style="background:url(img/zt_list.jpg) no-repeat 0 50%"><a href="http://uscnews.usc.edu.cn/ztpd.htm" target="_blank">专题网站</a></h2>
                <a class="more" href="http://uscnews.usc.edu.cn/ztpd.htm" target="_blank">更多</a>
            </div>
            <ul>
                <table align="center" cellspacing="10">
                    <tbody>
                    <tr>
                        <td> <a href="http://uscnews.usc.edu.cn/qgjydh.htm" title="全国教育大会学习宣传专题网" onclick="_addDynClicks(&quot;wbimage&quot;, 1275604863, 42014)" target="_blank"> <img src="wlj.jpg" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="http://uscnews.usc.edu.cn/bwcx_xb_/wzsy.htm" title="十九大" onclick="_addDynClicks(&quot;wbimage&quot;, 1275604863, 36788)" target="_blank"> <img src="bwcx.png" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="http://kjc.usc.edu.cn/index.htm" title="" onclick="_addDynClicks(&quot;wbimage&quot;, 1275604863, 36802)" target="_blank"> <img src="images/zhuanti/tu3.jpg" border="0" width="310" height="150" /> </a> </td>
                        <td> <a href="http://nhedu.beone2009.com/" title="" onclick="_addDynClicks(&quot;wbimage&quot;, 1275604863, 36800)" target="_blank"> <img src="images/zhuanti/tu2.jpg" border="0" width="310" height="150" /> </a> </td>
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
            <h3><img src="img/icon3.png" /><span class="span spana"> <a href="index/kstd.htm" target="_blank">快速通道</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://myportal.usc.edu.cn/" target="_blank" title="" style="padding-left:14px;">信息门户</a></li>
                <li><a href="http://61.187.179.73:7001/ppygzz/control/ppzplogin" target="_blank" title="" style="padding-left:27px;">人才招聘</a></li>
                <li><a href="http://www.usc.superlib.net/" target="_blank" title="" style="padding-left:15px;">图书资料</a></li>
                <li><a href="http://61.187.179.66:8924/" target="_blank" title="" style="padding-left:14px;">教务在线</a></li>
                <li><a href="http://mail.usc.edu.cn/" target="_blank" title="" style="padding-left:14px;">电子信箱</a></li>
                <li><a href="index/kstd.htm" target="_blank" title="更多" style="color:#064089;padding-left:27px;">&gt;&gt;</a></li>
            </ul>
        </div>
        <div class="main_list_one main_list_fore">
            <h3><img src="img/icon4.png" /><span class="span spana"> <a href="index/ggfwpt.htm" target="_blank">公共服务</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://fresh.usc.edu.cn:8084/yxwz/index.do" target="_blank" title="" style="padding-left:14px;">迎新网</a></li>
                <li><a href="http://qks.usc.edu.cn/zxtg.htm" target="_blank" title="学术期刊" style="padding-left:27px;">学术期刊</a></li>
                <li><a href="http://gxpx1.ceat.edu.cn/" target="_blank" title="中国教育干部网络学院高等教育管理干部培训平台" style="padding-left:15px;">干部培训平台</a></li>
                <li><a href="http://210.43.126.82" target="_blank" title="高校外语教学平台" style="padding-left:14px;">高校外语教学</a></li>
                <li><a href="http://www.hngbjy.com/" target="_blank" title="湖南省干部教育培训网络学院" style="padding-left:14px;">干部培训学院</a></li>
                <li><a href="index/ggfwpt.htm" target="_blank" title="更多" style="color:#064089;padding-left:27px;">&gt;&gt;</a></li>
            </ul>
        </div>
        <div class="main_list_one main_list_fore">
            <h3><img src="img/icon5.png" /><span class="span spana"> <a href="index/xxxt.htm" target="_blank">信息系统</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://172.20.9.43/userAction!to_login.action" target="_blank" title="科研管理系统" style="padding-left:14px;">科研管理系统</a></li>
                <li><a href="http://210.43.126.97:60177/login/index.aspx" target="_blank" title="继续教育管理系统" style="padding-left:27px;">继续教育管理</a></li>
                <li><a href="http://210.43.126.121:9090" target="_blank" title="" style="padding-left:15px;">目标管理考核</a></li>
                <li><a href="http://210.43.126.70:8085/KingoXS/log_in" target="_blank" title="学生综合管理系统" style="padding-left:14px;">学生综合管理</a></li>
                <li><a href="http://newoa.usc.edu.cn/oa/" target="_blank" title="" style="padding-left:14px;">OA协同办公系</a></li>
                <li><a href="index/xxxt.htm" target="_blank" title="更多" style="color:#064089;padding-left:27px;">&gt;&gt;</a></li>
            </ul>
        </div>
        <div class="main_list_one main_list_fore" style="float: right;margin-right: 0px">
            <h3><img src="img/icon6.png" /><span class="span spana"> <a href="index/yqlj.htm" target="_blank">友情链接</a></span></h3>
            <ul class="fore_list">
                <li><a href="http://www.hnedu.cn/index.shtml" target="_blank" title="湖南教育网" style="padding-left:14px;">湖南教育网</a></li>
                <li><a href="http://zwfw-new.hunan.gov.cn/" target="_blank" title="湖南政务服务网" style="padding-left:27px;">湖南政务服务</a></li>
                <li><a href="http://www.hnjy.com.cn/" target="_blank" title="为先在线网" style="padding-left:15px;">为先在线网</a></li>
                <li><a href="http://gov.hnedu.cn/index.shtml" target="_blank" title="湖南教育政务网" style="padding-left:14px;">省教政务</a></li>
                <li><a href="http://www.moe.edu.cn/" target="_blank" title="教育部" style="padding-left:14px;">教育部</a></li>
                <li><a href="index/yqlj.htm" target="_blank" title="更多" style="color:#064089;padding-left:27px;">&gt;&gt;</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
