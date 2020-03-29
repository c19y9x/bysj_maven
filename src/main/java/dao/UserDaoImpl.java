package dao;

import domain.Lanmu;
import domain.News;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
/*        StringBuilder sb = new StringBuilder(sql);
        //遍历map
        Set<String> keyset = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keyset)
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
        }
        System.out.println(sb.toString());
        System.out.println(params);
        return template.queryForObject(sb.toString(),Integer.class,params.toArray());*/
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
}
