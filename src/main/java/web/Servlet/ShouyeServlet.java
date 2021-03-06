package web.Servlet;

import domain.FilePath;
import domain.Lanmu;
import domain.News;
import domain.ShouyePage;
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
@WebServlet("/shouye")
public class ShouyeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        UserService service = new UserServiceImpl();
        //首页信息
        ShouyePage shouyePage = service.getShouyePage();
        session.setAttribute("sy",shouyePage);
        //轮播图路径
        List<FilePath> imgPaths = service.getImgPaths();
        request.setAttribute("imgPath",imgPaths);
        //4.转发到list.jsp
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doPost(request, response);
    }
}
