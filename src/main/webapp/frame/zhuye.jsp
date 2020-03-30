<%--
  Created by IntelliJ IDEA.
  User: 陈逸轩
  Date: 2020/3/26
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- <link href="mycss.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="common.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <script src="../js/jquery-1.12.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            setFrmHeight();
        });
        function setFrmHeight() {
            var frm = $(window.parent.document).find("#frm");
            var height = $(document).height();
            frm.height(height);
        }
    </script>
</head>
<body>
<div class="new">
    <div class="new-left">
        <div class="tz-title">
            <span><b>学院</b>要闻</span>
            <a target="_blank" href="${pageContext.request.contextPath}/erjiServlet">更多&gt;</a>
        </div>
        <div class="newcon">
            <div class="newcon-left" >
                <iframe width=370px height=328px src="lunbotu/index.html" frameborder="0" scrolling = "no"></iframe>
            </div>
            <div class="newcon-right" >
                <ul>
                    <c:forEach items="${news}" var="new1" varStatus="n">
                        <li style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a href="${pageContext.request.contextPath}/newServlet?id=${new1.id}" target="_blank">${new1.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="new-right">
        <div class="tz-title">
            <span><b>学术</b>聚焦</span>
            <a target="_blank" href="https://www.view.sdu.edu.cn/xsjj.htm">更多&gt;</a>
        </div>
        <ul>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1101/131625.htm" target="_blank">《抗疫：舆论正能量》疫情专报（3月21日）</a></span></li>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1021/132778.htm" target="_blank">张鹏在IANDC发表文章揭示标签割问题的计算困难性</a></span></li>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1021/132700.htm" target="_blank">基础医学院张利宁教授团队在精神疾病抑郁症研究方向获新进展</a></span></li>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1021/132652.htm" target="_blank">冯金奎教授课题组在二氧化碳资源化应用方面取得新进展</a></span></li>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1021/132651.htm" target="_blank">尹龙卫团队在MXene基材料光电催化领域获进展</a></span></li>
            <li><span><a href="https://www.view.sdu.edu.cn/info/1101/132560.htm" target="_blank">王学典：不倒的精神长城——从战疫看中华文明的“韧”性特质</a></span></li>
        </ul>
    </div>
</div>

<div class="box3">
    <div class="notic">
        <div class="tz-title">
            <span><b>通知</b>公告</span>
            <a target="_blank" href="https://www.view.sdu.edu.cn/tzgg.htm">更多&gt;</a>
        </div>
        <div class="noticlist">
            <ul class="tzlist">
                <li><span>2020-01-14</span><a href="http://www.rsrczp.sdu.edu.cn/info/1043/3372.htm" target="_blank">山东大学2020年诚聘海内外优秀人才</a></li>
                <li><span>2020-01-29</span><a href="http://www.qiluhospital.com/site2/xwdt/yygg/01/208386.shtml" target="_blank">山东大学齐鲁医院2020年事业编招聘...</a></li>
                <li><span>2019-04-08</span><a href="http://gj.sdu.edu.cn" target="_blank">山东大学美英澳2019年招生公告</a></li>
                <li><span>2019-08-30</span><a href="http://www.rsrczp.sdu.edu.cn/info/1047/3181.htm" target="_blank">山东大学2019年第二批教师外专业技...</a></li>
                <li><span>2019-05-13</span><a href="http://www.gsp.sdu.edu.cn/" target="_blank">山东大学中加合作办学项目2019年招...</a></li>
                <li><span>2019-09-01</span><a href="http://www.rsrczp.sdu.edu.cn/info/1049/3201.htm" target="_blank">山东大学2019年第二批管理岗位招聘...</a></li>
                <li><span>2019-05-15</span><a href="http://www.math.sdu.edu.cn/info/1045/11641.htm" target="_blank">关于校外机构冒名举办未来山大人夏...</a></li>
            </ul>
        </div>
    </div>
    <div class="notic">
        <div class="tz-title">
            <span><b>媒体</b>看山大</span>
            <a target="_black" href="https://www.media.sdu.edu.cn/">更多&gt;</a>
        </div>
        <ul class="mtlist">
            <li><a href="https://www.media.sdu.edu.cn/info/1005/49018.htm" target="_blank">[人民网]山大与济南签署协议，携手开创名城名校合作共进新...</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/49073.htm" target="_blank">[山东新闻联播]【众志成城 抗击疫情】画笔下的战“疫”</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/48953.htm" target="_blank">[光明日报客户端]山东大学和济南市深化校地合作 规划“一廊、五片区”</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/48970.htm" target="_blank">[海外网]山东大学与济南打造“山大系”品牌服务济南高质量发展</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/48978.htm" target="_blank">[大众日报]山东大学与济南市签署深化校地合作协议 沿经十路打...</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/48906.htm" target="_blank">[科技日报]6小时“生死时速”：阻断“炎症风暴”背后的营救术</a></li>
            <li><a href="https://www.media.sdu.edu.cn/info/1005/48897.htm" target="_blank">[Chinadaily]Shandong develops key equipment for critically-...</a></li>
        </ul>

    </div>
    <div class="notic lastnotic">
        <div class="tz-title">
            <span><b>学术</b>预告</span>
            <a target="_blank" href="https://www.view.sdu.edu.cn/xsyg.htm">更多&gt;</a>
        </div>
        <div class="xueshu">
            <ul>
                <li style="padding-top:0px;"> <span><b>25</b> 2020-03</span>
                    <dl>
                        <dt>
                            <a href="https://www.view.sdu.edu.cn/info/1020/132776.htm" target="_black" title="科学成长于生活的土壤——以蒸发冷却研究为例">科学成长于生活的土壤——以蒸发冷却研</a>
                        </dt>
                        <dd class="dd1">
                            时间：3月25日（周三）晚19:00
                        </dd>
                        <dd class="dd2">
                            地点：线上（腾讯会议）：367291390
                        </dd>
                    </dl> </li>
                <li> </li>
                <li> <span><b>19</b> 2020-03</span>
                    <dl>
                        <dt>
                            <a href="https://www.view.sdu.edu.cn/info/1020/132521.htm" target="_black" title="新杏坛：释《周易&middot;系辞》晋韩康伯注之“况”字">新杏坛：释《周易&middot;系辞》晋韩康伯注之</a>
                        </dt>
                        <dd class="dd1">
                            时间：2020年3月19日（星期四）19：00
                        </dd>
                        <dd class="dd2">
                            地点：“腾讯会议”线上进行 QQ群号：497624704
                        </dd>
                    </dl> </li>
                <li> </li>
                <li> <span><b>07</b> 2020-03</span>
                    <dl>
                        <dt>
                            <a href="https://www.view.sdu.edu.cn/info/1020/131860.htm" target="_black" title="山东大学&middot;关爱女性公益（直播）大讲堂">山东大学&middot;关爱女性公益（直播）大讲堂</a>
                        </dt>
                        <dd class="dd1">
                            时间：3月7日、8日（周六、周日）
                        </dd>
                        <dd class="dd2">
                            地点：网上直播
                        </dd>
                    </dl> </li>
                <li> </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
