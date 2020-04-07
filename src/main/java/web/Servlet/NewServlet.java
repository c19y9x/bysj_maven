package web.Servlet;

import domain.Lanmu;
import domain.NewPage;
import domain.News;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import service.UserService;
import service.UserServiceImpl;
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
        String _lid = request.getParameter("lid");
        int lid = Integer.parseInt(_lid);

        UserService service = new UserServiceImpl();
        News newss = service.getNew(Integer.parseInt(newid));
        List<Lanmu> lanmus = service.getLanmu();

        NewPage newPage = service.getNewPage(lid);

        request.setAttribute("newss",newss);
        request.setAttribute("lm",lanmus);
        request.setAttribute("newPage",newPage);
        //4.转发到list.jsp
        request.getRequestDispatcher("/erji_content.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
