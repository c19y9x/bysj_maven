<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/14
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h3 style="text-align: center;">首页轮播图设置</h3>
    <div style="text-align: center;">
        <span style="color: red">支持png,jpg,jpeg格式文件</span>
        <table style="margin: auto;border-collapse:separate; border-spacing:0px 10px;">
            <tr>
                <td><img src="${imgPath[0].path}" width="475px" height="175px"></td>
                <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                <td><form action="htlunbotu1?pathid=1" method="post" enctype="multipart/form-data">
                    <input  type="file" name="images" accept="image/jpeg,image/jpg,image/png">
                    <button  type="submit"  name="upload">上传</button>

                </form></td>
            </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <td><img src="${imgPath[1].path}" width="475px" height="175px"></td>
                <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                <td><form action="htlunbotu1?pathid=2" method="post" enctype="multipart/form-data">
                    <input  type="file" name="images">
                    <button  type="submit"  name="upload">上传</button>

                </form></td>
            </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <td><img src="${imgPath[2].path}" width="475px" height="175px"></td>
                <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                <td><form action="htlunbotu1?pathid=3" method="post" enctype="multipart/form-data">
                    <input  type="file" name="images">
                    <button  type="submit"  name="upload">上传</button>

                </form></td>
            </tr>
        </table>
    </div>


</body>
</html>
