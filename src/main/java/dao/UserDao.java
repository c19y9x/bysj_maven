package dao;

import domain.Lanmu;
import domain.News;
import domain.ShouyeContent;
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

    //获取首页各个栏目的文章标题（lid，zid为栏目和子栏目名，count为显示的条数，如果zid为0，则显示这个栏目下的所有信息）
    public List<News> getShouyebt(int lid,int zid,int count);

    //修改主栏目名
    void updateLm(int zid, String lanmuming);
    //修改子栏目名
    void updateZlm(int lid,int zid, String lanmuming);
    //根据栏目和子栏目id获取下面新闻
    public List<News> getNewsForlzid(int lid, int zid);
    //根据文章id删除
    public void delNew(int newid);
}
