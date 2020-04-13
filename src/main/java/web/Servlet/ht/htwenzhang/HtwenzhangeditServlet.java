package web.Servlet.ht.htwenzhang;

import domain.News;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//文章编辑界面类
@WebServlet("/htwenzhangedit")
public class HtwenzhangeditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        String _newid = request.getParameter("newid");
        int newid = Integer.parseInt(_newid);

        UserService service = new UserServiceImpl();
        News new1 = service.getNew(newid);
        session.setAttribute("new1",new1);
        request.getRequestDispatcher("houtaigl/main/articleEdit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
