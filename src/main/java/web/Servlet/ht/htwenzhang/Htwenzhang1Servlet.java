package web.Servlet.ht.htwenzhang;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.News;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//接受lid zid返回所属文章
@WebServlet("/htwenzhang1")
public class Htwenzhang1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        String _lid = request.getParameter("lid");
        String _zid = request.getParameter("zid");
        int lid = Integer.parseInt(_lid);
        int zid = Integer.parseInt(_zid);

        UserService service = new UserServiceImpl();
        List<News> news_bt = service.getNewsForlzid(lid, zid);
        System.out.println(news_bt);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),news_bt);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
