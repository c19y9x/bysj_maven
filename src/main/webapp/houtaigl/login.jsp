<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/7
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统登陆</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <link rel="stylesheet" href="houtaigl/my/css/login/bootstrap.min.css">
    <link rel="stylesheet" href="houtaigl/my/css/login/font-awesome.min.css">
    <link rel="stylesheet" href="houtaigl/my/css/login/themify-icons.css">
    <link rel="stylesheet" href="houtaigl/my/css/login/flag-icon.min.css">
    <link rel="stylesheet" href="houtaigl/my/css/login/cs-skin-elastic.css">

    <link rel="stylesheet" href="houtaigl/my/css/login/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <script>
        function tijiao_data() {
            if($("#admin_id").val() == null || $("#admin_id").val() == ''){
                alert("用户名不能为空");
                return false;
            }
            if($("#password").val() == null || $("#password").val() == ''){
                alert("密码不能为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-dark">

<div class="sufee-login d-flex align-content-center flex-wrap">
    <div class="container">
        <div class="login-content">
            <div class="login-logo">
                <a href="index.html">
                    <img class="align-content" src="img/logo_03.png" alt="">
                </a>
            </div>
            <div class="login-form">
                <form action="${pageContext.request.contextPath}/htlogin1" method="post">
                    <div class="form-group">
                        <label>管理员ID</label>
                        <input class="form-control" placeholder="管理员ID" name="admin_id" id="admin_id">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="password" class="form-control" placeholder="密码" name="password" id="password">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember Me
                        </label>

                    </div>
                    <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30" onclick="return tijiao_data()">Sign in</button>

                    <!-- <div class="register-link m-t-15 text-center"> -->
                    <!-- <p>Don't have account ? <a href="#"> Sign Up Here</a></p> -->
                    <!-- </div> -->
                </form>
                <!-- 出错显示的信息框 -->
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" >
                        <span>&times;</span>
                    </button>
                    <strong>${login_msg}</strong>
                </div>
            </div>
        </div>

    </div>
</div>


<script src="houtaigl/my/css/login/jquery.min.js"></script>
<script src="houtaigl/my/css/login/popper.min.js"></script>
<script src="houtaigl/my/css/login/bootstrap.min.js"></script>
<script src="houtaigl/my/css/login/main.js"></script>


</body>
</html>
