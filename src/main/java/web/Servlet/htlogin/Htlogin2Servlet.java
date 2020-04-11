package web.Servlet.htlogin;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Admin;
import domain.Lanmu;
import domain.ZiLanmu;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//登陆时判断是否是超级管理员用于跳过IP限制
@WebServlet("/htlogin2")
public class Htlogin2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        String _adminid = request.getParameter("adminid");

        int adminid = Integer.parseInt(_adminid);
        UserService service = new UserServiceImpl();
        Admin admin = service.getAdminById(adminid);

        if(admin != null){


        }else{
            //登录失败
            //提示信息
            request.setAttribute("login_msg","用户名或密码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/htlogin").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
