package web.Servlet.ht.htadmin;

import domain.Admin;
import domain.LoginData;
import domain.PageBean;
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
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        UserService service = new UserServiceImpl();
        if(service.isEmptyString(currentPage)) {
            currentPage = "1";
        }

        PageBean<LoginData> logindatas = service.getLogindatas(currentPage);

        request.setAttribute("logindatas",logindatas);
        //4.转发到list.jsp
        request.getRequestDispatcher("/houtaigl/admin/adminlogindata.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
