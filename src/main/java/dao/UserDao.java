package dao;

import domain.Lanmu;
import domain.News;
import domain.ZiLanmu;

import java.util.List;

public interface UserDao {
    public List<Lanmu> getLanmu();

    public List<News> getSynews();
    //获取新闻总数
    public int findTotalCount();
    //分页显示新闻
    public List<News> findByPage(int start, int rows);

    public int findTotalCount(int lid, int zid);

    public List<News> findByPage(int start, int rows,int lid, int zid);
    //获取栏目
    public String getLid(int lid);
    //获取栏目下的所有子栏目
    public List<ZiLanmu> getzids(int lid);
}
