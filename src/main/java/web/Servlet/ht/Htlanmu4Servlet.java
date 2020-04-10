package web.Servlet.ht;

import com.fasterxml.jackson.databind.ObjectMapper;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//栏目删除
@WebServlet("/htlanmu4")
public class Htlanmu4Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        String _lid = request.getParameter("lid");
        int lid = Integer.parseInt(_lid);
        String _zid = request.getParameter("zid");
        int zid = Integer.parseInt(_zid);

        UserService service = new UserServiceImpl();
        service.delLanmu(lid,zid);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
