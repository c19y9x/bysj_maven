package web.Servlet;

import domain.Lanmu;
import domain.News;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class ShouyeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();


        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select * from lanmu";
        List<Lanmu> lanmus = template.query(sql, new BeanPropertyRowMapper<Lanmu>(Lanmu.class));
        String sql1 = "SELECT * FROM news LIMIT 0,8; ";
        List<News> ns = template.query(sql1, new BeanPropertyRowMapper<News>(News.class));

        session.setAttribute("lm",lanmus);
        session.setAttribute("news",ns);
        //4.转发到list.jsp
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doPost(request, response);
    }
}
