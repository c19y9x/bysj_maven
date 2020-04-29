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
//批量删除登陆记录
@WebServlet("/htadminlogindata2")
public class Htadminlogindata2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String[] checkID = request.getParameterValues("logindataids");
        System.out.println(checkID.toString());
        UserService service = new UserServiceImpl();

        int[] logindataids = service.StringToInt(checkID);

        for (int i = 0; i < logindataids.length; i++) {
            service.delLogindata(logindataids[i]);
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
