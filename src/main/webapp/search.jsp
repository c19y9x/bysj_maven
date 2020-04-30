<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/12
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
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

    <title>搜索结果</title>

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

    <style>
        .p1{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 5;
            -webkit-box-orient: vertical;
        }
    </style>
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


        <div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav" style="background: #458B74;">
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
                            <img src="img/logo_032.png" style="width:100%;height:250%;" alt="">
                        </a>
                    </div>
                    <!--End of navbar-header-->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right main_menu">
                            <c:forEach items="${lm}" var="lanmu" varStatus="s">
                                <c:if test="${s.count == 1}">
                                    <li class=""><a href="${pageContext.request.contextPath}/shouye" style="color:aliceblue;">${lanmu.lanmuming} </a></li>
                                </c:if>
                                <c:if test="${s.count != 1}">
                                    <li class=""><a href="${pageContext.request.contextPath}/erjiServlet?lid=${lanmu.id}" style="color:aliceblue;">${lanmu.lanmuming} </a></li>
                                </c:if>
                            </c:forEach>
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
    <img src="img/erji/title1.gif" border="0" width="1140" height="235"/>
</div>

<div class="container container-fluid dynava no-padding cleafix" id="nrrrr" >
    <div class="con_wz_lf fl cleafix" style="margin-top: 0px">
        <h3><span class="windowstyle134374"> 搜索结果</span></h3>
        <!-- 左边栏目 -->

        <div class="nyzct">
            <img src="img/erji/404.jpg" border="0" width="192" height="127" />
        </div>
        <br><br>
    </div>

    <!-- 右边新闻标题部分 -->
    <div class="con_wz_fr fr cleafix">
        <div class="con_bt cleafix">
            <h3 class="fl"><span class="windowstyle134377"> ${pb.zids[zid-1].zlmname}</span></h3>
            <div class="fr">
                <table class="winstyle134378" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td nowrap="">当前位置：
                            <a href="${pageContext.request.contextPath}/shouye"><span class="fontstyle134378">首页</span></a>
                            <span class="splitflagstyle134378">&gt;&gt;</span><span class="fontstyle134378">搜索结果</span>
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
                    <form action="" method="post">
                        <input type="hidden" name="newskeycode" value="" />
                        <table class="listFrame" cellspacing="1" cellpadding="0" width="100%" border="0">
                            <input type="hidden" name="newskeycode" value="" />
                            <tbody id="test11">

                            <c:forEach items="${news}" var="new1" varStatus="n">
                                <%--style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"--%>
                                <tr>
                                    <td> <a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}&lid=${new1.lid}" style="text-decoration:none"> <span style="COLOR: #333333; FONT-FAMILY: 宋体; FONT-WEIGHT: bold; FONT-SIZE: 10pt;"> ${new1.title} </span> </a> <span style="float: right;">发表时间:<span style="COLOR: #333333; FONT-FAMILY: 宋体; FONT-WEIGHT: bold; FONT-SIZE: 10pt;"><fmt:formatDate value='${new1.add_time}' pattern='yyyy-MM-dd' /></span> </span></td>
                                </tr>
                                <tr>
                                    <td> <span style="FONT-FAMILY: 宋体; COLOR: #222222; FONT-SIZE: 9pt;"> <p class="p1">${new1.content} </p>></span> </td>
                                </tr>
                                <tr>
                                    <td> <br /> </td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
            </ul>
            <!-- 分页在这里加 -->
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
<script src="js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
    $(function() {
        setTimeout(function () {
            setFrmHeight();
        },100)

    });
    function setFrmHeight() {
        if($("#test11").children().length == 0)
        {
            var frm = $(window.document).find("#nrrrr");
            $(window.document).find("#test11").append("<p>无搜索结果</p>")
            frm.height(926);
        }
    }
</script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!-- Custom JavaScript-->
<script src="js/main.js"></script>
</html>


