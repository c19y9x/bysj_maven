package web.Servlet.ht.htadmin;

import domain.Admin;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/htadminedit")
public class HtadmineditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取id
        String id = request.getParameter("id");
        //2.调用Service查询
        UserService service = new UserServiceImpl();
        Admin admin = service.getAdminById(Integer.parseInt(id));
        System.out.println(admin);
        //3.将user存入request
        request.setAttribute("admin",admin);
        //4.转发到update.jsp
        request.getRequestDispatcher("houtaigl/admin/adminEdit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
