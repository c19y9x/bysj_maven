## 项目结构
该项目使用到的技术为jsp+Servlet+tomcat+mysql<br>
下面提到的栏目指主栏目(即首页右上角的七个栏目),子栏目指栏目下面的二级栏目
* src 
    * main 代码
        * java java代码
            * dao 数据库实现类
            * domain 数据库实体类
                * Admin 管理员类
                * Lanmu 栏目名(院系概况，专业建设等)
                * ZiLanmu 子栏目名(栏目下的二级栏目)
                * NewPage 存储新闻内容界面的当前栏目和子栏目
                * News 新闻类(用于封装新闻通知)
                * PageBean 二级界面类(存储二级界面的各种信息，如分页信息等)
                * ShouyeContent 存储首页界面上的各个栏目的标题和内容(除了最上面的所有栏目)
                * ShouyePage 首页界面信息类
            * service 用户服务类
            * util 工具类
            * web web相关的类(如servlet)
                * Servlet 
                    * ShouyeServlet 显示首页信息
                    * NewServlet 显示新闻消息
                    * ErjiServlet 显示二级界面(新闻标题界面)    
                    * ht 后台
                        * HoutaiServlet 显示后台管理主界面
                        * htlanmu
                            * HtlanmuServlet 后台管理-栏目管理
                            * Htlanmu1Servlet 功能类:根据栏目id获取此栏目下的子栏目
                            * Htlanmu2Servlet 功能类:栏目更新
                        * htwenzhang
                            * Htwenzhang1Servlet 功能类:接受栏目lid zid返回所属文章
                            * Htwenzhang2Servlet 功能类:根据newid删除文章
                            * Htwenzhang3Servlet 功能类:多选删除文章
                            * Htwenzhangadd1Servlet 功能类:添加文章
                            * Htwenzhangedit1Servlet 功能类:更新修改文章
                            * HtwenzhangeditServlet 文章编辑界面类
                            * HtwenzhangServlet 文章管理界面类
                        * htadmin 后台管理员列表界面
                            * HtadminServlet  后台管理员列表界面
                            * Htadmin1Servlet 功能类:修改账号密码
                            * Htadmin2Servlet 功能类:增加管理员
                            * Htadmin3Servlet 功能类:删除管理员
                            * HtadmineditServlet 修改管理员信息界面
                            * HtadminIPLimit1Servlet 功能类:更新ip限制规则
                            * HtadminIPLimitServlet ip限制界面
                            * HtadminlogindataServlet 管理员登陆记录界面
                            * Htadminlogindata1Servlet 功能类:删除登陆记录
                        * htlunbotu  首页滚动图片设置界面
                            * HtlunbotuServlet 首页滚动图片设置界面
                            * Htlunbotu1Servlet 功能类:修改首页滚动图片
                    * htlogin 后台系统登陆界面
                        * HtloginServlet 界面类
                        * Htlogin1Servlet 功能类：登陆逻辑判断
        * resources 资源文件
            * druid.properties 数据库配置文件
        * webapp 界面文件
            * index.jsp 首页
                * 内部用了frame框架集成了frame/zhuye.jsp
            * erji_biaoti.jsp 主页下的二级界面(左侧有导航栏),可以理解为放文章标题的界面
            * erji_content.jsp 放文章内容的界面
            * search.jsp 新闻搜索界面
            * houtaigl 后台管理界面
                * admin 管理员列表界面
                * main  栏目文章管理界面
                * index.jsp 后台管理主界面
                * login.jsp 后台登陆界面
                
* 后台界面设计
    * 栏目文章管理
        * 栏目管理
            * 功能:对各个栏目及其子栏目进行管理
        ```
           设置一个下拉菜单。下面为表格，显示栏目名
            下拉菜单可选0-9
             选中1-9后表格显示对应子栏目
             选中0后显示所有栏目
        ```
        * 文章管理
            * 功能:可以选择显示全部文章或者各个栏目下的文章
                   可以实现文章添加修改和(批量)删除功能。
    * 管理员用户
        * 管理员管理
            * 功能:实现管理员账户的增删查改。
        * 管理员ip限制
            * 功能:对非超级管理员账户进行ip限制
        * 管理员登陆记录
            * 功能:查看管理员账户的登陆记录
    * 其他设置
        * 首页滚动图片   
            * 功能:对首页滚动展示的图片进行更改
        
        
## bysj数据库
* admin表 管理员信息
* iplimit ip限制表，限制的ip地址
* lanmu表 用于存储网站的几个栏目
* logindata表 用于存储管理员登陆记录
* news表 存储新闻
    * 所有文章内容放一张表。在表中添加lid和zid用于定位所在栏目位置
* 其他表 lanmu表的子栏目

## 待优化问题
* 文章标题界面加载时因为框架问题会闪一下
    * 看能否将shouye_xyxw.jsp和frame/new_biaotu.jsp合并 已合并
* 栏目管理
    * 添加栏目未完成
    * 复选框批量删除栏目未完成
* 文章管理
    * 复选框批量删除文章未完成  已完成
    
## 笔记
* ErjiServlet运行过程(从首页到二级界面)
```$xslt
    传入四个参数(当前页码，每页显示条数，栏目id，子栏目id)
        对其进行处理，若为空，设为默认值
        当前页码为1，每页显示条数为10，栏目id为1（首页），子栏目id为1（子栏目第一个）
    调用service.findNewsByPage ---返回的是一个PageBean
        先将当前页码，每页显示条数封装进去
        调用dao.findTotalCount(lid,zid)获得当前页面的总新闻条数并封装
            这里如果是第一次从首页访问，zid默认为1，即界面上默认显示的是子栏目1的新闻
        调用dao.getLid(lid)获得当前页面的所有子栏目名称
        分页操作
    这样，在二级界面收到的一个PageBean内包含了
         //分页参数
         int totalCount; // 总记录数
         int totalPage ; // 总页码
         int currentPage ; //当前页码
         int rows;//每页显示的记录数
         //页面显示的内容
         Lanmu lm; //栏目名             --上方栏目集合
         List<ZiLanmu> zids; //子栏目名  --左侧子栏目
         List<T> list ; // 每页的数据    --新闻标题
```
* 权限控制实现
```aidl
    权限分为三种:超级管理员，学工办，教务办
        超级管理员能访问所有设置
        学工办只能访问栏目文章管理中的学生工作，招生就业以及下面的子栏目
        教务办只能访问栏目文章管理中的院务公开以及下面的子栏目
    实现方式:
        首先在houtaigl的index.jsp中用<c:if>标签控制左侧出现的设置(超级管理员显示全部设置，其他只显示除了管理员管理之外的设置)
        对于栏目文章管理对不同权限用户的区别显示 功能实现:
            可以在HtlanmuServlet中对请求头的admin进行权限id查询，对不同的权限给予不同的返回信息
```

* 首页文章搜索
```aidl
    首先，数据库模糊查询，如select * from news where title like '%待查询内容%'
    查询出来的文章应该在java中进行处理:
        截取含有查询内容的前后部分,在前台部分显示.
        实现:
        因为只是简略显示，故可以去除HTML元素只保留文本。(web/Servlet/NewSearchServlet.java的delHTMLTag方法)
        然后搜索内容在文本中的第一个位置，将这个位置以前的内容删除
            int a = str.indexOf(SearchContent);
            str = str.substring(a , str.length());
        然后使用正则表达式将剩余文本中的搜索内容加上颜色
            Pattern pattern = Pattern.compile(SearchContent);
            Matcher matcher = pattern.matcher(str);
            str = matcher.replaceAll("<span style='color:#dd4b39'>"+SearchContent+"</span>");
```


    


