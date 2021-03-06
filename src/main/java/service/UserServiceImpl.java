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
    public int[] StringToInt(String[] arrs) {
        int[] ints = new int[arrs.length];
        for (int i = 0; i < arrs.length ; i++) {
            ints[i] = Integer.parseInt(arrs[i]);
        }
        return ints;
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
        titles.add("学风</b>建设");
        titles.add("招生</b>就业");
        titles.add("教学</b>信息");
        titles.add("");

        List<List<News>> news = new ArrayList<List<News>>();

        news.add(dao.getShouyebt(8,3,8)); //院务公开-学院要闻 显示8条
        news.add(dao.getShouyebt(4,2,6));
        news.add(dao.getShouyebt(6,3,7));
        news.add(dao.getShouyebt(7,0,7));
        news.add(dao.getShouyebt(3,0,7));
        news.add(dao.getShouyebt(8,2,8));

        List<ShouyeContent> shouyeContents = new ArrayList<>();


        for (int i = 0; i < 6; i++) {
            ShouyeContent sc = new ShouyeContent();
            sc.setTitle(titles.get(i));
            sc.setNews(news.get(i));
            shouyeContents.add(sc);
        }
        shouyePage.setShouyeContents(shouyeContents);

        return shouyePage;
    }

    @Override
    public List<ZiLanmu> getZlmforlm(int lid) {
        return dao.getzids(lid);
    }

    @Override
    public void updateLm(int lid, int zid, String lanmuming) {
        if(lid == 0)
            dao.updateLm(zid,lanmuming);
        else
            dao.updateZlm(lid,zid,lanmuming);
    }

    @Override
    public List<News> getNewsForlzid(int lid, int zid) {
        return dao.getNewsForlzid(lid,zid);
    }

    @Override
    public void delNew(int newid) {
        dao.delNew(newid);
    }

    @Override
    public News getNew(int newid) {
        return dao.getNew(newid);
    }

    @Override
    public void updateNew(News new1) {
        dao.updateNew(new1);
    }

    @Override
    public void addNew(News new1) {
        dao.addNew(new1);
    }

    @Override
    public NewPage getNewPage(int lid) {
        NewPage newPage = new NewPage();
        String str_lid = dao.getLid(lid);
        List<ZiLanmu> zids = dao.getzids(lid);

        Lanmu lm = new Lanmu();
        lm.setId(lid);
        lm.setLanmuming(str_lid);

        newPage.setLm(lm);
        newPage.setZids(zids);

        return newPage;
    }

    @Override
    public Admin login(Admin admin) {
        return dao.findAdmin(admin.getAdmin_id(),admin.getPassword());
    }

    @Override
    public List<Admin> getAdmins() {
        return dao.getAdmins();
    }

    @Override
    public void updateAdmin(Admin admin) {
        dao.updateAdmin(admin);
    }

    @Override
    public Admin getAdminById(int id) {
        return dao.getAdminById(id);
    }

    @Override
    public List<Lanmu> getLanmuById(int i) {
        return dao.getLanmuById(i);
    }

    @Override
    public void addAdmin(Admin admin) {
        dao.addAdmin(admin);
    }

    @Override
    public void addLm(int lid, String lanmuming) {
        dao.addLm(lid,lanmuming);
    }

    @Override
    public void delLanmu(int lid, int zid) {
        dao.delLanmu(lid, zid);
    }

    @Override
    public void deladmin(int adminid) {
        dao.deladmin(adminid);
    }

    @Override
    public List<Iplimit> getIPvalues() {
        return dao.getIPvalues();
    }

    @Override
    public void updateIPlimit(String iplimit1, String iplimit2) {
        dao.updateIPlimit(iplimit1, iplimit2);
    }

    @Override
    public List<News> getNewsForSearch(String new_key) {
        return dao.getNewsForSearch(new_key);
    }

    @Override
    public List<FilePath> getImgPaths() {
        return dao.getImgPaths();
    }

    @Override
    public void updateImgPath(int pathid, String s) {
        dao.updateImgPath(pathid,s);
    }

    @Override
    public void addLoginData(LoginData loginData) {
        dao.addLoginData(loginData);
    }

    @Override
    public PageBean<LoginData> getLogindatas(String _currentPage) {
        int currentPage = Integer.parseInt(_currentPage);
        if(currentPage <=0) { //当页码为第一页时不能往前翻页
            currentPage = 1;
        }

        PageBean<LoginData> pblogindatas = new PageBean<>();
        pblogindatas.setCurrentPage(currentPage); //设置当前页码
        pblogindatas.setRows(10);  //每页显示的信息条数

        int totalCount = dao.Logindatastotal();
        pblogindatas.setTotalCount(totalCount); //设置记录总条数

        int start = (currentPage - 1) * 10;
        List<LoginData> loginDataList = dao.getLogindatas(start); //设置从数据库查询时的其实查询地址
        pblogindatas.setList(loginDataList); //设置登陆记录

        int totalPage = (totalCount % 10)  == 0 ? totalCount/10 : (totalCount/10) + 1;
        pblogindatas.setTotalPage(totalPage); //设置总页码

        if(currentPage > totalPage) { //当页码为最后一页时不能往后翻页
            pblogindatas.setCurrentPage(totalPage);
        }
        return pblogindatas;
    }

    @Override
    public void delLogindata(int logindataid) {
        dao.delLogindata(logindataid);
    }
}
