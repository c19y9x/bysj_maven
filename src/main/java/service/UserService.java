package service;

import domain.*;

import java.util.List;

public interface UserService {
    //获取所有的栏目
    public List<Lanmu> getLanmu();
    //获取首页下新闻公告的所有新闻内容
    public List<News> getSynews();
    //分页获取新闻标题
    public PageBean<News> findNewsByPage(String currentPage, String rows, String lid, String zid);


    //java程序中要用的的工具类
    // * 判断字符串是否为空
    public boolean isEmptyString(String str);
    //String数组转int数组
    public int[] StringToInt(String[] arrs);

    //获取首页所有信息(上方栏目表和图片下的内容)
    public ShouyePage getShouyePage();

    //根据栏目获取子栏目
    public List<ZiLanmu> getZlmforlm(int lid);

    //修改栏目名
    void updateLm(int lid, int zid, String lanmuming);
    //根据栏目和子栏目id获取下面新闻
    public List<News> getNewsForlzid(int lid, int zid);
    //删除文章
    public void delNew(int newid);
    //根据文章id返回文章
    public News getNew(int newid);
    //修改文章
    public void updateNew(News new1);
    //添加文章
    public void addNew(News new1);


    //获取文章内容界面的主栏目名和子栏目名
    public NewPage getNewPage(int lid);

    //登陆判断语句
    public Admin login(Admin admin);
    //查询管理员
    public List<Admin> getAdmins();
    //修改管理员信息
    public void updateAdmin(Admin admin);
    //根据id获取管理员信息
    public Admin getAdminById(int id);
    //权限控制，给不同权限不同的栏目管理,参数i是请求的栏目id,如请求栏目2-院系管理和栏目2-栏目3专业建设。i=23；
    public List<Lanmu> getLanmuById(int i);
    //增加管理员
    public void addAdmin(Admin admin);
    //添加栏目
    public void addLm(int lid, String lanmuming);
    //删除栏目
    public void delLanmu(int lid, int zid);
    //删除管理员
    void deladmin(int adminid);
    //获取ip限制地址
    public List<Iplimit> getIPvalues();
    //更新IP控制规则
    public void updateIPlimit(String iplimit1, String iplimit2);


    //根据搜索词返回文章
    public List<News> getNewsForSearch(String new_key);


    //返回轮播图的三个文件路径
    public List<FilePath> getImgPaths();
    //更新轮播图路径
    void updateImgPath(int pathid, String s);
}
