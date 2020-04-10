package web.Servlet.ht.htadmin;

import com.fasterxml.jackson.databind.ObjectMapper;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//删除管理员
@WebServlet("/htadmin3")
public class Htadmin3Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        String _adminid = request.getParameter("adminid");
        int adminid = Integer.parseInt(_adminid);

        UserService service = new UserServiceImpl();
        service.deladmin(adminid);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
