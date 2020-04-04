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
//批量删除文章
@WebServlet("/htwenzhang3")
public class Htwenzhang3Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String[] checkID = request.getParameterValues("checkID");

        UserService service = new UserServiceImpl();
        int[] newids = service.StringToInt(checkID);

        for (int i = 0; i < newids.length; i++) {
            service.delNew(newids[i]);
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
