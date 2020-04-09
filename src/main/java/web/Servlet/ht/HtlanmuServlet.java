package web.Servlet.ht;

import domain.Admin;
import domain.Lanmu;
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
//栏目管理界面类
@WebServlet("/htlanmu")
public class HtlanmuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        UserService service = new UserServiceImpl();
        Admin admin = (Admin)session.getAttribute("admin");
        System.out.println(admin);

        List<Lanmu> lanmus;
        //权限控制
        switch (admin.getAuthority()){
            case 1:
                lanmus = service.getLanmuById(67);
                break;
            case 2:
                lanmus = service.getLanmuById(8);
                break;
            default:
                lanmus = service.getLanmu();
        }

        session.setAttribute("lms",lanmus);
        //4.转发到list.jsp
        request.getRequestDispatcher("/houtaigl/main/lanmuguanli.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
