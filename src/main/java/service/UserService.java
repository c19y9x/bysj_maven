package service;

import domain.Lanmu;
import domain.News;
import domain.PageBean;

import java.util.List;

public interface UserService {
    //获取所有的栏目
    public List<Lanmu> getLanmu();
    //获取首页下新闻公告的所有新闻内容
    public List<News> getSynews();
    //分页获取新闻标题
    public PageBean<News> findNewsByPage(String currentPage, String rows);


    //java程序中要用的的工具类
    // * 判断字符串是否为空
    public boolean isEmptyString(String str);
}
