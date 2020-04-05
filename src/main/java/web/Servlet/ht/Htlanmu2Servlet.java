package web.Servlet.ht;

import domain.Lanmu;
import domain.ShouyePage;
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
//栏目更新功能类
@WebServlet("/HtlmeditServlet")
public class Htlanmu2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String lanmuming = request.getParameter("lanmuming");

        String _lid = request.getParameter("lid");//栏目名
        String _zid = request.getParameter("zid");//子栏目名
        int zid = Integer.parseInt(_zid);
        int lid = Integer.parseInt(_lid);

        UserService service = new UserServiceImpl();
        service.updateLm(lid,zid,lanmuming);
        response.sendRedirect(request.getContextPath()+"/htlanmu");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
