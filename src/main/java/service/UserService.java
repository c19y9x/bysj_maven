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

    //获取首页所有信息(上方栏目表和图片下的内容)
    public ShouyePage getShouyePage();

    //根据栏目获取子栏目
    public List<ZiLanmu> getZlmforlm(int lid);

    //修改栏目名
    void updateLm(int lid, int zid, String lanmuming);
    //根据栏目和子栏目id获取下面新闻
    public List<News> getNewsForlzid(int lid, int zid);
}
