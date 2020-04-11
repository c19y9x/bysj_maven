package dao;

import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Lanmu> getLanmu() {
        String sql = "select * from lanmu";
        List<Lanmu> lanmus = template.query(sql, new BeanPropertyRowMapper<Lanmu>(Lanmu.class));
        return lanmus;
    }

    @Override
    public List<News> getSynews() {
        String sql1 = "SELECT * FROM news LIMIT 0,8; ";
        List<News> ns = template.query(sql1, new BeanPropertyRowMapper<News>(News.class));
        return ns;
    }

    @Override
    public int findTotalCount() {
        //定义一个模板sql
        String sql = "select count(*) from news where 1 = 1 ";

        return template.queryForObject(sql,Integer.class);
    }

    @Override
    public List<News> findByPage(int start, int rows) {
        String sql = "select * from news where 1 = 1";

        StringBuilder sb = new StringBuilder(sql);
        //遍历map
        //Set<String> keyset = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<Object>();
        /*for (String key : keyset)
        {
            //排除分页条件参数，
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];

            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");  //加条件的值
            }
        }*/

        //添加分页查询
        sb.append(" limit ?,?");
        //添加分页查询值
        params.add(start);
        params.add(rows);
        sql = sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<News>(News.class),params.toArray());
    }

    @Override
    public int findTotalCount(int lid, int zid) {
        //定义一个模板sql
        String sql = "select count(*) from news where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(zid == 0)
            sb.append(" and lid = "+ lid);
        else
            sb.append(" and lid = "+ lid +" and zid = " + zid);
        sql = sb.toString();
        return template.queryForObject(sql,Integer.class);
    }
    //分页获取新闻
    @Override
    public List<News> findByPage(int start, int rows, int lid, int zid) {
        String sql = "select * from news where 1 = 1";

        StringBuilder sb = new StringBuilder(sql);
        //遍历map
        //Set<String> keyset = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<Object>();

        if(zid == 0)
            sb.append(" and lid = "+ lid + " and zid = 1 ");
        else
            sb.append(" and lid = "+ lid +" and zid = " + zid);

        //添加分页查询
        sb.append(" ORDER BY add_time DESC limit ?,?");
        //添加分页查询值
        params.add(start);
        params.add(rows);
        sql = sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<News>(News.class),params.toArray());
    }

    @Override
    public String getLid(int lid) {
        String sql = "SELECT lanmuming FROM lanmu WHERE id = " + lid;
        return template.queryForObject(sql,String.class);
    }

    @Override
    public List<ZiLanmu> getzids(int lid) {
        String str_lid = null;
        //根据栏目id决定查询哪一个表
        switch(lid){
            case 1:
                str_lid = "sy";break;
            case 2:
                str_lid = "yxgk";break;
            case 3:
                str_lid = "zyjs";break;
            case 4:
                str_lid = "xkjs";break;
            case 5:
                str_lid = "yjsjx";break;
            case 6:
                str_lid = "xsgz";break;
            case 7:
                str_lid = "zsjy";break;
            case 8:
                str_lid = "ywgk";break;
            default:
                break;
        }
        String sql = "SELECT * FROM "+str_lid;
        List<ZiLanmu> zilanmus = template.query(sql, new BeanPropertyRowMapper<ZiLanmu>(ZiLanmu.class));
        return zilanmus;
    }

    @Override
    public List<News> getShouyebt(int lid,int zid,int count) {
        String sql = "select * from news where 1 = 1";

        StringBuilder sb = new StringBuilder(sql);

        if(zid == 0)
            sb.append(" and lid = "+ lid);
        else
            sb.append(" and lid = "+ lid +" and zid = " + zid);

        //添加分页查询
        sb.append(" limit 0,"+count);
        //添加分页查询值
        sql = sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<News>(News.class));
    }

    @Override
    public void updateLm(int zid, String lanmuming) {
        String sql = "update lanmu set lanmuming = ? where id = ?";
        template.update(sql, lanmuming,zid);
    }

    @Override
    public void updateZlm(int lid,int zid, String lanmuming) {
        String str_lid = null;
        //根据栏目id决定查询哪一个表
        switch(lid){
            case 1:
                str_lid = "sy";break;
            case 2:
                str_lid = "yxgk";break;
            case 3:
                str_lid = "zyjs";break;
            case 4:
                str_lid = "xkjs";break;
            case 5:
                str_lid = "yjsjx";break;
            case 6:
                str_lid = "xsgz";break;
            case 7:
                str_lid = "zsjy";break;
            case 8:
                str_lid = "ywgk";break;
            default:
                break;
        }
        String sql = "update "+str_lid+" set zlmname = ? where id = ?";
        template.update(sql, lanmuming,zid);
    }

    @Override
    public List<News> getNewsForlzid(int lid, int zid) {
        String sql = "select id,title,add_time,lid,zid from news where 1 = 1";

        StringBuilder sb = new StringBuilder(sql);
        //当lid为0，说明选中了所有栏目，显示全部新闻
        if(lid == 0)
            ;
        else{
            if(zid == 0)
                sb.append(" and lid = "+ lid);
            else
                sb.append(" and lid = "+ lid +" and zid = " + zid);
        }
        //按时间降序排列
        sb.append(" ORDER BY add_time DESC");
        //添加分页查询值
        sql = sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<News>(News.class));
    }

    @Override
    public void delNew(int newid) {
        //1.定义sql
        String sql = "delete from news where id = ?";
        //2.执行sql
        template.update(sql, newid);
    }

    @Override
    public News getNew(int newid) {
        String sql = "SELECT * FROM news WHERE id = " + newid;
        return template.queryForObject(sql,new BeanPropertyRowMapper<News>(News.class));
    }

    @Override
    public void updateNew(News new1) {
        String sql = "update news set title = ?,content = ? ,add_time = ? , lid = ? , zid = ? where id = ?";
        template.update(sql, new1.getTitle(),new1.getContent(),new1.getAdd_time(),new1.getLid(),new1.getZid(),new1.getId());
    }

    @Override
    public void addNew(News new1) {
        String sql = "insert into news values(null,?,?,?,?,?)";
        template.update(sql, new1.getTitle(),new1.getContent(),new1.getAdd_time(),new1.getLid(),new1.getZid());
    }

    @Override
    public Admin findAdmin(String admin_id, String password) {
        try {
            String sql = "select * from admin where admin_id = ? and password = ?";
            Admin admin = template.queryForObject(sql, new BeanPropertyRowMapper<Admin>(Admin.class), admin_id, password);
            return admin;
        } catch (Exception e) {
            //e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Admin> getAdmins() {
        String sql = "select * from admin";

        return template.query(sql,new BeanPropertyRowMapper<Admin>(Admin.class));
    }

    @Override
    public void updateAdmin(Admin admin) {
        String sql = "update admin set admin_id = ?,password = ? ,authority = ? where id = ?";
        template.update(sql, admin.getAdmin_id(),admin.getPassword(),admin.getAuthority(),admin.getId());
    }

    @Override
    public Admin getAdminById(int id) {
        String sql = "select * from admin where id = "+id;
        return template.queryForObject(sql,new BeanPropertyRowMapper<Admin>(Admin.class));
    }

    @Override
    public List<Lanmu> getLanmuById(int i) {
        String sql = "SELECT * FROM lanmu WHERE 2 < 1";
        StringBuilder sb = new StringBuilder(sql);
        int j;
        while(i != 0){
            j = i % 10;
            sb.append(" or id = " + j);
            i = i/10;
        }
        return template.query(sb.toString(), new BeanPropertyRowMapper<Lanmu>(Lanmu.class));
    }

    @Override
    public void addAdmin(Admin admin) {
        String sql = "insert into admin values(null,?,?,?)";
        template.update(sql, admin.getAdmin_id(),admin.getPassword(),admin.getAuthority());
    }

    @Override
    public void addLm(int lid, String lanmuming) {
        String str_lid = null;
        //根据栏目id决定查询哪一个表
        switch(lid){
            case 1:
                str_lid = "sy";break;
            case 2:
                str_lid = "yxgk";break;
            case 3:
                str_lid = "zyjs";break;
            case 4:
                str_lid = "xkjs";break;
            case 5:
                str_lid = "yjsjx";break;
            case 6:
                str_lid = "xsgz";break;
            case 7:
                str_lid = "zsjy";break;
            case 8:
                str_lid = "ywgk";break;
            default:
                break;
        }
        String sql = "insert into "+str_lid+" values(null,?)";
        template.update("ALTER TABLE "+ str_lid+" AUTO_INCREMENT = 1;");
        template.update(sql, lanmuming);
    }

    @Override
    public void delLanmu(int lid, int zid) {
        String str_lid = null;
        //根据栏目id决定查询哪一个表
        switch(lid){
            case 1:
                str_lid = "sy";break;
            case 2:
                str_lid = "yxgk";break;
            case 3:
                str_lid = "zyjs";break;
            case 4:
                str_lid = "xkjs";break;
            case 5:
                str_lid = "yjsjx";break;
            case 6:
                str_lid = "xsgz";break;
            case 7:
                str_lid = "zsjy";break;
            case 8:
                str_lid = "ywgk";break;
            default:
                break;
        }
        String sql = "delete from "+str_lid+" where id = ?";
        template.update(sql, zid);
    }

    @Override
    public void deladmin(int adminid) {
        String sql = "delete from admin where id = ?";
        template.update(sql, adminid);
    }

    @Override
    public List<Iplimit> getIPvalues() {
        String sql = "SELECT * FROM iplimit";
        return template.query(sql, new BeanPropertyRowMapper<Iplimit>(Iplimit.class));
    }
}
