package dao;

import domain.Lanmu;
import domain.News;

import java.util.List;

public interface UserDao {
    public List<Lanmu> getLanmu();

    public List<News> getSynews();
    //获取新闻总数
    public int findTotalCount();
    //分页显示新闻
    public List<News> findByPage(int start, int rows);
}
