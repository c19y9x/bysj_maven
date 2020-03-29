package web.Servlet;

import domain.News;
import domain.PageBean;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/erijServlet")
public class ErijServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        UserService service = new UserServiceImpl();
        if(service.isEmptyString(currentPage))
            currentPage = "1";
        if(service.isEmptyString(rows))
            rows = "5";
        //2.调用service查询
        PageBean<News> pb = service.findNewsByPage(currentPage,rows);

        System.out.println(pb);

        //3.将PageBean存入request
        session.setAttribute("pb",pb);
        //request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到list.jsp
        request.getRequestDispatcher("/shouye_xyxw.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}