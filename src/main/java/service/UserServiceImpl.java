package service;


import dao.UserDao;
import dao.UserDaoImpl;
import domain.*;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();
    @Override
    //获取所有的栏目
    public List<Lanmu> getLanmu() {
        return dao.getLanmu();
    }

    @Override
    public List<News> getSynews() {
        return dao.getSynews();
    }

    @Override
    public PageBean<News> findNewsByPage(String _currentPage, String _rows, String _lid, String _zid) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        int lid = Integer.parseInt(_lid);
        int zid = Integer.parseInt(_zid);

        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean对象
        PageBean<News> pb = new PageBean<News>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findTotalCount(lid,zid);
        pb.setTotalCount(totalCount);


        //设置lid和zid
        String str_lid = dao.getLid(lid);
        List<ZiLanmu> zids = dao.getzids(lid);

        Lanmu lm = new Lanmu();
        lm.setId(lid);
        lm.setLanmuming(str_lid);

        pb.setLm(lm);
        pb.setZids(zids);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<News> list = dao.findByPage(start,rows,lid,zid);
        pb.setList(list);

        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pb.setTotalPage(totalPage);

        if(currentPage > totalPage) {
            pb.setCurrentPage(totalPage);
        }

        return pb;
    }

    @Override
    public boolean isEmptyString(String str)  {
        return str == null || str.trim().length() == 0;
    }

    @Override
    public ShouyePage getShouyePage() {
        ShouyePage shouyePage = new ShouyePage();

        //获取所有栏目并封装
        List<Lanmu> lanmus = dao.getLanmu();
        shouyePage.setLanmus(lanmus);

        List<String> titles = new ArrayList<String>();
        titles.add("学院</b>要闻");
        titles.add("学术</b>聚焦");
        titles.add("通知</b>公告");
        titles.add("招生</b>就业");
        titles.add("教学</b>信息");



        List<List<News>> news = new ArrayList<List<News>>();

        news.add(dao.getShouyebt(1,1,8)); //首页-学院要闻 显示8条
        news.add(dao.getShouyebt(4,2,6));
        news.add(dao.getShouyebt(8,2,7));
        news.add(dao.getShouyebt(7,0,7));
        news.add(dao.getShouyebt(3,0,7));

        List<ShouyeContent> shouyeContents = new ArrayList<>();


        for (int i = 0; i < 5; i++) {
            ShouyeContent sc = new ShouyeContent();
            sc.setTitle(titles.get(i));
            sc.setNews(news.get(i));
            shouyeContents.add(sc);
        }
        shouyePage.setShouyeContents(shouyeContents);

        return shouyePage;
    }
}
