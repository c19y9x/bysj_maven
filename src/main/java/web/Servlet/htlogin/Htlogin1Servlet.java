package web.Servlet.htlogin;

import domain.Admin;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/htlogin1")
public class Htlogin1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        Map<String, String[]> map = request.getParameterMap();
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //System.out.println(admin);
        UserService service = new UserServiceImpl();
        Admin admin1 = service.login(admin);
        if(admin1 != null){
            //登录成功
            //将用户存入session
            session.setAttribute("admin",admin1);
            if(admin1.getAuthority() == 0)
                session.setAttribute("ipno",true);
            else
                session.setAttribute("ipno",false);
            //跳转页面
            response.sendRedirect(request.getContextPath()+"/houtaigl");
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
