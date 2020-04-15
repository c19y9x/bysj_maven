package web.Servlet.ht.htadmin;

import domain.Admin;
import domain.LoginData;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

//管理员登陆记录
@WebServlet("/htadminlogindata")
public class HtadminlogindataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        UserService service = new UserServiceImpl();

        List<LoginData> logindatas = service.getLogindatas();
        System.out.println(logindatas);
        request.setAttribute("logindatas",logindatas);
        //4.转发到list.jsp
        request.getRequestDispatcher("/houtaigl/admin/adminlogindata.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
