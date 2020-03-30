package service;

import dao.UserDao;
import dao.UserDaoImpl;
import domain.Lanmu;
import domain.News;
import domain.PageBean;
import domain.ZiLanmu;

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
        pb.setLid(str_lid);
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
}
