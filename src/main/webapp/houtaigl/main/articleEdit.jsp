<%@ page import="domain.News" %><%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/4/4
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Title</title>
    <%--<link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-1.12.3.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>--%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        .myrow {
            display: flex;
            flex-direction: row;
            /*margin-left:1em;*/
        }

        .xxxx {
            height: 2px;
            background: #999999;
            margin-top: 16px;
            width: 2em;
            margin-left: 1em;
            margin-right: 1em;
        }
    </style>

    <script>
        $(function () {
            $("#btns button").prop("type","button");

            //给第一个下拉菜单绑定离焦事件
            /*
            * 先给主栏目下拉菜单绑定一个离焦事件(根据lid查下面的zid)，
            * 设置主栏目下拉菜单选中的值为lid(即让它显示当前栏目)
            * 让这个离焦事件加载完自动完成
            * 再设置子栏目下拉菜单选中的值
            * */
            $("#lm").blur(function () {
                var lanmu_cx = ${new1.lid};

                $("select[id='zlm'] option").remove();
                //htwenzhang1用于处理根据第一个下拉菜单的栏目获取子栏目显示在第二个下拉菜单中
                $.get("htlanmuAdmin",{lid:lanmu_cx},function (data) {
                    var list = data;
                    for(var i = 0;i < list.length ;i++){
                        if(lanmu_cx == 1)
                        {
                            //如果选的lid为1(即选中所有栏目)，则第二个下拉菜单不显示任何东西
                            $("#zlm").append("<option value='0'></option>");break;
                        }
                        else
                            $("#zlm").append("<option value='"+ (i+1) +"'>"+list[i].zlmname +"</option>");
                    }
                });

            });

            $("#emmmmm").click(function () {
                $("#lm option[value='${new1.lid}']").attr("selected",true);
                $("#zlm option[value='${new1.zid}']").attr("selected",true);
            })
            $("#lm").trigger("blur");
            //不知道为啥，得加个定时器才能正常运行，不能直接$("#emmmmm").trigger("click");
            //可能是第二个下拉菜单还没加载出来的原因？
            setTimeout(function () {
                $("#emmmmm").trigger("click");
            },100);


        });



    </script>

</head>
<body>
    <div class="container">
        <center><h3>文章编辑</h3></center>
        <form action="" method="post">
            <div class="form-group">
                <label for="title">标题：</label>
                <input type="text" class="form-control" id="title" name="title" value="${new1.title}">
            </div>

            <br>
            <div class="form-inline">
                <div class="form-group">
                    <label for="lm">文章位置：</label>
                    <select name="lanmum" class="form-control" id="lm">
                        <c:forEach items="${lms}" var="lanmu" varStatus="s">
                            <c:if test="${s.count == 1}">
                                <option value="1">所有栏目</option>
                            </c:if>
                            <c:if test="${s.count != 1}">
                                <option value="${lanmu.id}">${lanmu.lanmuming}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    ------
                    <select name="zlm" class="form-control" id="zlm">
                        <option value='0'></option>
                    </select>
                    <a type="hidden" id="emmmmm"></a>
                </div>
            </div>

            <br>
            <div class="form-group ">
                <label for="datetimepicker1">添加日期</label>
                <div class="myrow">

                    <div class='input-group date' style="width: 14em;" id='datetimepicker1'>
                        <input type='text' class="timeInput form-control" />
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
					</span>
                    </div>
                </div>
            </div>

            <br>
            <div class="form-group">
                <label >文章内容：</label>
                    <script id="editor" type="text/plain" style="width:1140px;height:500px;"></script>
                <div id="btns">
                    <div>
                        <button onclick="getAllHtml()">获得整个html的内容</button>
                        <button onclick="getContent()">获得内容</button>
                        <button onclick="setContent()">写入内容</button>
                        <button onclick="setContent(true)">追加内容</button>
                        <button onclick="getContentTxt()">获得纯文本</button>
                        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
                        <button onclick="hasContent()">判断是否有内容</button>
                        <button onclick="setFocus()">使编辑器获得焦点</button>
                        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
                        <button onmousedown="setblur(event)" >编辑器失去焦点</button>

                    </div>
                    <div>
                        <button onclick="getText()">获得当前选中的文本</button>
                        <button onclick="insertHtml()">插入给定的内容</button>
                        <button id="enable" onclick="setEnabled()">可以编辑</button>
                        <button onclick="setDisabled()">不可编辑</button>
                        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
                        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
                        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
                    </div>

                    <div>
                        <button onclick="getLocalData()" >获取草稿箱内容</button>
                        <button onclick="clearLocalData()" >清空草稿箱</button>
                    </div>

                </div>
                <div>
                    <button onclick="createEditor()">
                        创建编辑器</button>
                    <button onclick="deleteEditor()">
                        删除编辑器</button>
                </div>
            </div>

            <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
                <input class="btn btn-default" type="button" value="返回" />
            </div>
        </form>
    </div>
</body>
<script>
    $(function() {
        $('#form1').hide();
        var picker1 = $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn'),
            //minDate: '2016-7-1'
        });
        var picker2 = $('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        //动态设置最小值
        picker1.on('dp.change', function(e) {
            picker2.data('DateTimePicker').minDate(e.date);
        });
        //动态设置最大值
        picker2.on('dp.change', function(e) {
            picker1.data('DateTimePicker').maxDate(e.date);
        });
    });
    $('#datetimepicker1').datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn'),
        defaultDate: "${new1.add_time}",
        showClear:true
    });
</script>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        //var value = prompt('${new1.title}', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        //UE.getEditor('editor').setContent('<h1>欢迎使用ueditor</h1>', isAppendTo);
        UE.getEditor('editor').setContent('${new1.content}', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
</html>
