package web.Servlet.ht.htadmin;

import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//更新ip限制规则
@WebServlet("/htadminIPLimit1")
public class HtadminIPLimit1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String iplimit1 = request.getParameter("ip_limit1");
        String iplimit2 = request.getParameter("ip_limit2");

        UserService service = new UserServiceImpl();
        service.updateIPlimit(iplimit1,iplimit2);
        response.sendRedirect(request.getContextPath()+"/htadminIPLimit");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
