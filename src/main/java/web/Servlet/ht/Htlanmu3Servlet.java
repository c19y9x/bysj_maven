package web.Servlet.ht;

import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//栏目添加
@WebServlet("/htlanmu3")
public class Htlanmu3Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String lanmuming = request.getParameter("lanmuming");

        String _lid = request.getParameter("lid");//栏目名

        int lid = Integer.parseInt(_lid);
        System.out.println(lanmuming);
        UserService service = new UserServiceImpl();
        service.addLm(lid,lanmuming);
        response.sendRedirect(request.getContextPath()+"/htlanmu");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
