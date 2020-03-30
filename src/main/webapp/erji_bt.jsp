<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/30
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Title</title>

    <!--    自己添加的-->
    <link rel="stylesheet" href="css/my/style.css">
    <link rel="stylesheet" href="css/my/global.css">
    <link rel="stylesheet" href="css/my/h5.css">
    <link rel="stylesheet" href="css/my/nv.css">
    <!--    Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!--Fontawesom-->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!--Animated CSS-->
    <link rel="stylesheet" type="text/css" href="css/animate.min.css">

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--Bootstrap Carousel-->
    <link type="text/css" rel="stylesheet" href="css/carousel.css" />

    <link rel="stylesheet" href="css/isotope/style.css">

    <!--Main Stylesheet-->
    <link href="css/style.css" rel="stylesheet">
    <!--Responsive Framework-->
    <link href="css/responsive.css" rel="stylesheet">



    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body data-spy="scroll" data-target="#header">
<%--栏目栏和他的上面--%>
<!--Start Hedaer Section-->
<section id="header">
    <div class="header-area">
        <div class="top_header">
            <!--最顶上的一层(地址号码等)-->
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
                        <div class="address">
                            <i class="fa fa-home floatleft"></i>
                            <p>湖南吉首市人民南路120号</p>
                        </div>
                    </div>
                    <!--End of col-md-4-->
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
                        <div class="phone">
                            <i class="fa fa-phone floatleft"></i>
                            <p>+ 18867217873</p>
                        </div>
                    </div>
                    <!--End of col-md-4-->
                    <!-- <div class="col-md-4">
                        <div class="social_icon text-right">
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-youtube"></i></a>
                        </div>
                    </div> -->
                    <!--End of col-md-4-->
                    <!--搜索框-->
                    <div class="social_icon text-right">
                        <form action="search.jsp?wbtreeid=1058" method="post" id="au6a" name="au6a" onsubmit="" style="display: inline">
                            <input type="hidden" id="lucenenewssearchkey134318" name="lucenenewssearchkey" value="">
                            <input name="showkeycode" id="showkeycode134318" class="textCss" value="请输入搜索关键字">
                            <input type="image" src="img/shouye/search_03.png" align="absmiddle" class="search" style="cursor: hand">
                        </form>
                    </div>
                </div>
                <!--End of row-->
            </div>
            <!--End of container-->
        </div>
        <!--End of top header-->


        <div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav" style="background: #005f9c;">
            <div class="container">
                <nav class="navbar navbar-default zero_mp ">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!--校徽-->
                        <a class="navbar-brand custom_navbar-brand" href="#">
                            <img src="img/logo_03.png" style="width:100%;height:250%;" alt="">
                        </a>
                    </div>
                    <!--End of navbar-header-->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right main_menu">
                            <li class=""><a href="" style="color:aliceblue;">首页 <span class="sr-only"></span></a></li>
                            <li><a href="" style="color:aliceblue;">院系概况</a></li>
                            <li><a href="" style="color:aliceblue;">专业建设</a></li>
                            <li><a href="" style="color:aliceblue;">学科建设</a></li>
                            <li><a href="" style="color:aliceblue;white-space:nowrap;">研究生教学</a></li>
                            <li><a href="" style="color:aliceblue;">学生工作</a></li>
                            <li><a href="" style="color:aliceblue;">招生就业</a></li>
                            <li><a href="" style="color:aliceblue;">院务公开</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
                <!--End of nav-->
            </div>
            <!--End of container-->
        </div>
        <!--End of header menu-->
    </div>
    <!--end of header area-->
</section>
<!--End of Hedaer Section-->

<div class="container container-fluid no-padding nvbanner">
    <img src="img/erji/nyba_03.jpg" border="0" />
</div>

<div class="container container-fluid dynava no-padding cleafix" id="nrrrr">
    <div class="con_wz_lf fl cleafix">
        <h3><span class="windowstyle134374"> ${pb.lid}</span></h3>
        <!-- 左边栏目 -->
        <ul>
            <%-- <li><a href="syl.htm" title="双一流">双一流</a></li>
             <li><a href="zdxk.htm" title="重点学科">重点学科</a></li>--%>
                <c:forEach items="${pb.zids}" var="zid" varStatus="s">
                    <li><a href="" title="${zid.zlmname}">${zid.zlmname}</a></li>
                </c:forEach>
        </ul>
        <div class="nyzct">
            <img src="img/erji/nylb_03.jpg" border="0" width="192" height="127" />
        </div>
    </div>

    <!-- 右边新闻标题部分 -->
    <div class="con_wz_fr fr cleafix">
        <div class="con_bt cleafix">
            <h3 class="fl"><span class="windowstyle134377"> ${pb.lid}</span></h3>
            <div class="fr">
                <table class="winstyle134378" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td nowrap="">当前位置：
                            <a href="../../index.htm"><span class="fontstyle134378">首页</span></a>
                            <span class="splitflagstyle134378">&gt;&gt;</span><a href="../../jyjx.htm"><span class="fontstyle134378">${pb.lid}</span></a>
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
                <%--文章标题显示--%>
                <c:forEach items="${pb.list}" var="neww" varStatus="n">
                    <li style="text-align:left;"> <a href="${pageContext.request.contextPath}/newServlet?id=${neww.id}" target="_blank" title="学科建设"> ${neww.title}</a><span class="fr"><fmt:formatDate value='${neww.add_time}' pattern='yyyy-MM-dd' /></span></li>

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
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erjiServlet?currentPage=1'">首页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erjiServlet?currentPage=${pb.currentPage - 1}'">上页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erjiServlet?currentPage=${pb.currentPage + 1}'">下页</button>
                                            <button type="button" class="btn btn-default"
                                                    onclick="window.parent.location.href = '${pageContext.request.contextPath}/erjiServlet?currentPage=${pb.totalPage}'">尾页</button>
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

<!--Start of footer-->
<section id="footer">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-6">
                <div class="copyright">
                    <p>Copyright &copy; 2011-2020 吉首大学物理与机电工程学院</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="designer">
                    <p></p>
                </div>
            </div>
        </div>
        <!--End of row-->
    </div>
    <!--End of container-->
</section>
<!--End of footer-->



<!--Scroll to top-->
<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
<!--End of Scroll to top-->

</body>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!-- Custom JavaScript-->
<script src="js/main.js"></script>
</html>

