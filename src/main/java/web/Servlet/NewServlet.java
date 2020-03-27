package web.Servlet;

import domain.News;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/newServlet")
public class NewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String newid = request.getParameter("id");

        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "SELECT * FROM news where id ="+newid;
        List<News> newss = template.query(sql, new BeanPropertyRowMapper<News>(News.class));
        System.out.println(newss);
        //3.将PageBean存入request
        request.setAttribute("newss",newss);
        //4.转发到list.jsp
        request.getRequestDispatcher("/erji_content.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
