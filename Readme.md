##项目结构
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
                        * HtlanmuServlet 后台管理-栏目管理
                        * Htlanmu1Servlet 功能类:根据栏目id获取此栏目下的子栏目
                        * Htlanmu2Servlet 功能类:栏目更新
                        * Htwenzhang1Servlet 功能类:接受栏目lid zid返回所属文章
                        * Htwenzhang2Servlet 功能类:根据newid删除文章
                        * Htwenzhang3Servlet 功能类:多选删除文章
                        * Htwenzhangadd1Servlet 功能类:添加文章
                        * Htwenzhangedit1Servlet 功能类:更新修改文章
                        * HtwenzhangeditServlet 文章编辑界面类
                        * HtwenzhangServlet 文章管理界面类
                        * htadmin 后台管理员列表界面
                            * Htadmin1Servlet 功能类:修改账号密码
                            * HtadminServlet  后台管理员列表界面类
                    * htlogin 后台系统登陆界面
                        * HtloginServlet 界面类
                        * Htlogin1Servlet 功能类：登陆逻辑判断
        * resources 资源文件
            * druid.properties 数据库配置文件
            * ipConfig.properties 限制ip配置文件
        * webapp 界面文件
            * index.jsp 首页
                * 内部用了frame框架集成了frame/zhuye.jsp
            * erji_biaoti.jsp 主页下的二级界面(左侧有导航栏),可以理解为放文章标题的界面
            * erji_content.jsp 放文章内容的界面
            * houtaigl 后台管理界面
                * admin 管理员列表界面
                * main  栏目文章管理界面
                * index.jsp 后台管理主界面
                * login.jsp 后台登陆界面
              
        
        
## bysj数据库
* lanmu表 用于存储网站的几个栏目
* news表 存储新闻
    * 所有文章内容放一张表。在表中添加lid和zlid用于定位所在栏目位置
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
        首先在houtaigl的index.jsp中用<c:if>标签控制左侧出现的设置
        
```

* 后台界面设计
    * 栏目文章管理
        * 栏目管理
        ```
           设置一个下拉菜单。下面为表格，显示栏目名
            下拉菜单可选0-9
             选中1-9后表格显示对应子栏目
             选中0后显示所有栏目
        ```
        * 文章管理
    * 管理员用户
    


