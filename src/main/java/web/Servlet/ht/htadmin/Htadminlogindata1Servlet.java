package web.Servlet.ht.htadmin;

import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//删除登陆记录根据id
@WebServlet("/htadminlogindata1")
public class Htadminlogindata1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String _logindataid = request.getParameter("logindataid");

        UserService service = new UserServiceImpl();
        service.delLogindata(Integer.parseInt(_logindataid));
        response.sendRedirect(request.getContextPath()+"/htadminlogindata");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
