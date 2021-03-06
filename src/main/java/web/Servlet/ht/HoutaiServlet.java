package web.Servlet.ht;

import domain.Admin;
import domain.LoginData;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/houtaigl")
public class HoutaiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        //创建登陆记录类
        LoginData loginData = new LoginData();
        loginData.setAdmin_id(admin.getAdmin_id());
        loginData.setLogintime(new Date());
        loginData.setIp(request.getRemoteAddr());

        UserService service = new UserServiceImpl();
        service.addLoginData(loginData);

        request.getRequestDispatcher("/houtaigl/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
