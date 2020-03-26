<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/24
  Time: 21:27
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
                            <input name="showkeycode" id="showkeycode134318" class="textCss" value="请输入搜索关键字" "="">
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

<section>
    <div class="container container-fluid no-padding nvbanner">
        <img src="img/erji/nyba_03.jpg" border="0" />
    </div>
    <div class="container container-fluid dynava no-padding cleafix">
        <div class="con_wz_lf fl cleafix">
            <h3><span class="windowstyle134429"> 吉首大学</span></h3>
            <ul>
                <li class="meaus"><a href="jyjx/xkjs.htm">学科建设</a></li>
                <ul class="zs">
                    <li><a href="jyjx/xkjs/syl.htm">双一流</a></li>
                    <li><a href="jyjx/xkjs/zdxk.htm">重点学科</a></li>
                </ul>
                <li><a href="jyjx/bksjy.htm">本科生教育</a></li>
                <li><a href="jyjx/yjsjy.htm">研究生教育</a></li>
                <li><a href="jyjx/lxsjy.htm">留学生教育</a></li>
                <li><a href="jyjx/jxjy.htm">继续教育</a></li>
                <li><a href="jyjx/cxcy.htm">创新创业</a></li>
            </ul>
            <div class="nyzct">
                <img src="img/erji/nylb_03.jpg" border="0" width="192" height="127" />
            </div>
        </div>
        <div class="con_wz_fr fr cleafix">
            <div class="con_bt cleafix">
                <h3 class="fl"></h3>
                <div class="fr">
                    <table class="winstyle134378" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td nowrap="">当前位置： <a href="index.htm"><span class="fontstyle134378">首页</span></a><span class="splitflagstyle134378">&gt;&gt;</span><a href="jyjx.htm"><span class="fontstyle134378">教育教学</span></a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="dpwx_nv">
                <script>
                    function seeContenta11(contentid,size,displayid)
                    {
                        document.getElementById(contentid).innerHTML = "[";
                        for(var i=0;i<=size;i++)
                        {
                            var allcontentid = contentid+(i+1);
                            if(allcontentid==displayid)
                            {
                                document.getElementById(contentid).innerHTML += " <span id='"+allcontentid+"' name='"+allcontentid+"' "+' class="wb_content" '+" >"+(i+1)+"</span> ";
                                document.getElementById(displayid).style.display = 'block';
                            }else
                            {
                                document.getElementById(contentid).innerHTML += " <span style='cursor:pointer' id='"+allcontentid+"' name='"+allcontentid+"' onclick=seeContenta11('"+contentid+"','"+size+"','"+allcontentid+"') "+' class="wb_content" '+" >"+(i+1)+"</span> ";
                                document.getElementById(allcontentid).style.display = "none";
                            }
                        }

                        document.getElementById(contentid).innerHTML += "]";
                    }
                </script>
                <table class="wb_window" width="100%">
                </table>
                <table cellspacing="" cellpadding="" border="0">
                    <tbody>
                    <tr>
                        <td align="center"><span class="titlestyle134386">${newss[0].content}</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<br><br>

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
</html>