##项目结构
* src 
    * main 代码
        * java java代码
            * dao 数据库实现类
            * domain 数据库实体类
                * Lanmu 栏目名(院系概况，专业建设等)
                * ZiLanmu 子栏目名(栏目下的二级栏目)
                * News 新闻类(用于封装新闻通知)
                * PageBean 界面分页类(存储二级界面的各种信息，如分页信息等)
            * service 用户服务类
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
```
    


