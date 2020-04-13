package web.Servlet.ht.htadmin;

import domain.Admin;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

//修改账号密码以及权限
@WebServlet("/htadmin1")
public class Htadmin1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取map
        Map<String, String[]> map = request.getParameterMap();
        //封装对象
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(admin);
        UserService service = new UserServiceImpl();
        service.updateAdmin(admin);
        response.sendRedirect(request.getContextPath()+"/htadmin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
