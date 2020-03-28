package dao;

import domain.Lanmu;
import domain.News;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

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
}
