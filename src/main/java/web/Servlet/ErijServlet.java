package web.Servlet;

import domain.Lanmu;
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
import java.util.List;

@WebServlet("/erjiServlet")
public class ErijServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        String lid = request.getParameter("lid");//栏目名
        String zid = request.getParameter("zid");//子栏目名

        UserService service = new UserServiceImpl();
        if(service.isEmptyString(currentPage))
            currentPage = "1";
        if(service.isEmptyString(rows))
            rows = "10";
        if(service.isEmptyString(zid))
            zid = "1";
        if(service.isEmptyString(lid))
            lid = "1";

        int int_zid = Integer.parseInt(zid);

        //2.调用service查询
        PageBean<News> pb = service.findNewsByPage(currentPage,rows,lid,zid);
        List<Lanmu> lanmus = service.getLanmu();
        System.out.println(pb);
        //3.将PageBean存入request
        request.setAttribute("pb",pb);
        //用于确定子栏目是哪一个(显示在右侧标题部分的左上方)
        request.setAttribute("zid",int_zid);
        //主栏目栏
        request.setAttribute("lm",lanmus);

        request.getRequestDispatcher("/erji_bt.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
