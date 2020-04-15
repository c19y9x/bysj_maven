<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/23
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>吉首大学物理与机电工程学院</title>

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
  <script>
    function search_news(e) {
      e.preventDefault();
      var a = $("#showkeycode134318").val();
      if(a == null || a == ''){
        alert("请输入搜索内容");
      }
      else{
        window.location.href = "${pageContext.request.contextPath}/newSearch?new_key="+a;
      }
    }
  </script>
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
          <div class="col-md-4">
              <div class="social_icon text-right">
                  <%--<a href=""><i class="fa fa-facebook"></i></a>
                  <a href=""><i class="fa fa-twitter"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-youtube"></i></a>--%>
                    <form action="" method="post" id="au6a" name="au6a" onsubmit="" style="display: inline">
                      <input type="hidden" id="lucenenewssearchkey134318" name="lucenenewssearchkey" value="">
                      <input name="showkeycode" id="showkeycode134318" class="textCss" value="" placeholder="请输入搜索内容">
                      <input type="image" src="img/shouye/search_03.png" align="absmiddle" class="search" style="cursor: hand" onclick="search_news(event)">
                    </form>
                  <a href="${pageContext.request.contextPath}/htlogin">[后台管理]</a>
              </div>
          </div>
          <!--End of col-md-4-->
          <!--搜索框-->
          <%--<div class="social_icon text-right">
            <form action="" method="post" id="au6a" name="au6a" onsubmit="" style="display: inline">
              <input type="hidden" id="lucenenewssearchkey134318" name="lucenenewssearchkey" value="">
              <input name="showkeycode" id="showkeycode134318" class="textCss" value="" placeholder="请输入搜索内容">
              <input type="image" src="img/shouye/search_03.png" align="absmiddle" class="search" style="cursor: hand" onclick="search_news(event)">
            </form>
          </div>--%>

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
              <img src="img/logo_03.png" style="width:100%;height:250%;" alt="" >
            </a>
          </div>
          <!--End of navbar-header-->

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right main_menu">
              <c:forEach items="${sy.lanmus}" var="lanmu" varStatus="s">
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



<!--Start of slider section(图片展示)-->
<section id="slider">
  <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel" data-interval="3000">
    <!-- Indicators(切换图片按钮) -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <!--滑动的图片-->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <div class="slider_overlay">
          <img src="${imgPath[0].path}" alt="..." width="1900px" height="700px">
          <div class="carousel-caption">
            <div class="slider_text">
              <!-- <h3>Protect</h3>
              <h2>nature the environment</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
              <!-- <a href="" class="custom_btn">Read  More</a> -->
            </div>
          </div>
        </div>
      </div>
      <!--End of item With Active-->
      <div class="item">
        <div class="slider_overlay">
          <img src="${imgPath[1].path}" alt="..." width="1900px" height="700px">
          <div class="carousel-caption">
            <div class="slider_text">
              <!-- <h3>Protect</h3>
              <h2>nature the environment</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <a href="" class="custom_btn">Read  More</a> -->
            </div>
          </div>
        </div>
      </div>
      <!--End of Item-->
      <div class="item">
        <div class="slider_overlay">
          <img src="${imgPath[2].path}" alt="..." width="1900px" height="700px">
          <div class="carousel-caption">
            <div class="slider_text">
              <!-- <h3>Protect</h3>
              <h2>nature the environment</h2>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <a href="" class="custom_btn">Read  More</a> -->
            </div>
          </div>
        </div>
      </div>
      <!--End of item-->
    </div>
    <!--End of Carousel Inner-->
  </div>
</section>
<!--end of slider section-->



<!-- 开始 -->
<div>
<%--  style="height: 800px;"--%>
<%--  用id="frm"控制frame框的大小(代码在zhuye.jsp)--%>
  <iframe id="frm" width="100%" src="frame/zhuye.jsp" frameborder="0"  scrolling = "no"></iframe>
</div>
<!-- 结束 -->

<div>
  <iframe id="frm1" width="100%" src="frame/frlink.jsp" frameborder="0"  scrolling = "no"></iframe>
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


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
<script src="js/jquery-1.12.3.min.js"></script>

<!--Counter UP Waypoint-->
<script src="js/waypoints.min.js"></script>
<!--Counter UP-->
<script src="js/jquery.counterup.min.js"></script>

<script>
  //for counter up
  $('.counter').counterUp({
    delay: 10,
    time: 1000
  });
</script>
<!--Isotope-->
<script src="js/isotope/min/scripts-min.js"></script>
<script src="js/isotope/cells-by-row.js"></script>
<script src="js/isotope/isotope.pkgd.min.js"></script>
<script src="js/isotope/packery-mode.pkgd.min.js"></script>
<script src="js/isotope/scripts.js"></script>


<!--Back To Top-->
<script src="js/backtotop.js"></script>


<!--JQuery Click to Scroll down with Menu-->
<script src="js/jquery.localScroll.min.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<!--WOW With Animation-->
<script src="js/wow.min.js"></script>
<!--WOW Activated-->
<script>
  new WOW().init();
</script>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<!-- Custom JavaScript-->
<script src="js/main.js"></script>
</body>

</html>
