##项目结构
* src 
    * main 代码
        * java java代码
            * domain 数据库实体类
                * Lanmu 栏目名(院系概况，专业建设等)
                * News 新闻类(用于封装新闻通知)
            * util 工具类
            * web web相关的类(如servlet)
                * Servlet 
                    * ShouyeServlet 显示首页信息
                    * NewServlet 显示新闻消息       
        * resources 资源文件
        * webapp 界面文件
            * index.jsp 首页
                * 内部用了frame框架集成了frame/zhuye.jsp
            * erji_biaoti.jsp 主页下的二级界面(左侧有导航栏),可以理解为放文章标题的界面
            * erji_content.jsp 放文章内容的界面
            * shouye_xyxw.jsp 首页-学院新闻-更多新闻界面
        
        
## bysj数据库
* lanmu表 用于存储网站的几个栏目
* news表 存储新闻
    * 所有文章内容放一张表。在表中添加lid和zlid用于定位所在栏目位置
* 其他表 lanmu表的子栏目

## 待优化问题
* 文章标题界面加载时因为框架问题会闪一下
    * 看能否将shouye_xyxw.jsp和frame/new_biaotu.jsp合并 已合并


