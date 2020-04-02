package web.Servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Lanmu;
import domain.ShouyePage;
import domain.ZiLanmu;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/htlanmuAdmin")
public class HtlanmuAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        String _lid = request.getParameter("lid");

        int lid = Integer.parseInt(_lid);
        UserService service = new UserServiceImpl();
        Map<String,Object> map = new HashMap<String,Object>();
        List<ZiLanmu> zlm = service.getZlmforlm(lid);

        //创建Jackson的核心对象  ObjectMapper
        ObjectMapper mapper = new ObjectMapper();

        String json = mapper.writeValueAsString(zlm);
        System.out.println(json);
        mapper.writeValue(response.getWriter(),zlm);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
