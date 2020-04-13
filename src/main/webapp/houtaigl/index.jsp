<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/1
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="houtaigl/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="houtaigl/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="houtaigl/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">

    <div class="dl-title">
        <a href="" title="地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
            <span class="lp-title-port">物理与机电工程学院</span><span class="dl-title-text"></span>
        </a>
        <a href="http://www.cssmoban.com">后台管理系统</a>
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${admin.admin_id}</span><a href="${pageContext.request.contextPath}/htlogin" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title">小秘书<s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
            <%--<li class="nav-item"><div class="nav-item-inner nav-order">表单页</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-inventory">搜索页</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-supplier">详情页</div></li>--%>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="houtaigl/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="houtaigl/assets/js/bui.js"></script>
<script type="text/javascript" src="houtaigl/assets/js/config.js"></script>

<script>
    BUI.use('common/main',function(){
        var config = [{
            id:'menu',
            homePage : 'pageadmin',
            menu:[{
                text:'栏目文章管理',
                items:[
                    {id:'pageadmin',text:'栏目管理',href:'htlanmu',closeable : false},
                    {id:'second-menu',text:'文章管理',href:'htwenzhang'},
                ]
            }<c:if test="${admin.authority == 0}">,
                {
                text:'管理员用户',
                items:[
                    {id:'operation',text:'管理员管理',href:'htadmin'},
                    {id:'quick',text:'管理员IP限制',href:'htadminIPLimit'}
                ]

            }</c:if>
            ,{
                text:'其他设置',
                items:[
                    {id:'resource',text:'滚动公告栏设置',href:'main/resource.html'}
                    //{id:'loader',text:'引入JS方式',href:'main/loader.html'}
                ]
            }]
        },{
            id:'form',
            menu:[{
                text:'表单页面',
                items:[
                    {id:'code',text:'表单代码',href:'form/code.html'},
                    {id:'example',text:'表单示例',href:'form/example.html'},
                    {id:'introduce',text:'表单简介',href:'form/introduce.html'},
                    {id:'valid',text:'表单基本验证',href:'form/basicValid.html'},
                    {id:'advalid',text:'表单复杂验证',href:'form/advalid.html'},
                    {id:'remote',text:'远程调用',href:'form/remote.html'},
                    {id:'group',text:'表单分组',href:'form/group.html'},
                    {id:'depends',text:'表单联动',href:'form/depends.html'}
                ]
            },{
                text:'成功失败页面',
                items:[
                    {id:'success',text:'成功页面',href:'form/success.html'},
                    {id:'fail',text:'失败页面',href:'form/fail.html'}

                ]
            },{
                text:'可编辑表格',
                items:[
                    {id:'grid',text:'可编辑表格',href:'form/grid.html'},
                    {id:'form-grid',text:'表单中的可编辑表格',href:'form/form-grid.html'},
                    {id:'dialog-grid',text:'使用弹出框',href:'form/dialog-grid.html'},
                    {id:'form-dialog-grid',text:'表单中使用弹出框',href:'form/form-dialog-grid.html'}
                ]
            }]
        },{
            id:'search',
            menu:[{
                text:'搜索页面',
                items:[
                    {id:'code',text:'搜索页面代码',href:'search/code.html'},
                    {id:'example',text:'搜索页面示例',href:'search/example.html'},
                    {id:'example-dialog',text:'搜索页面编辑示例',href:'search/example-dialog.html'},
                    {id:'introduce',text:'搜索页面简介',href:'search/introduce.html'},
                    {id:'config',text:'搜索配置',href:'search/config.html'}
                ]
            },{
                text : '更多示例',
                items : [
                    {id : 'tab',text : '使用tab过滤',href : 'search/tab.html'}
                ]
            }]
        },{
            id:'detail',
            menu:[{
                text:'详情页面',
                items:[
                    {id:'code',text:'详情页面代码',href:'detail/code.html'},
                    {id:'example',text:'详情页面示例',href:'detail/example.html'},
                    {id:'introduce',text:'详情页面简介',href:'detail/introduce.html'}
                ]
            }]
        }];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
</body>
</html>
