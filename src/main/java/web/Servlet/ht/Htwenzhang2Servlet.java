package web.Servlet.ht;

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

//删除文章
@WebServlet("/htwenzhang2")
public class Htwenzhang2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");

        String _newid = request.getParameter("newid");
        int newid = Integer.parseInt(_newid);

        UserService service = new UserServiceImpl();
        service.delNew(newid);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
