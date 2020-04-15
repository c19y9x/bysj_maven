package web.Servlet.ht.htlunbotu;

import domain.Admin;
import domain.FilePath;
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

@WebServlet("/htlunbotu")
public class HtlunbotuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService service = new UserServiceImpl();

        List<FilePath> imgPaths = service.getImgPaths();
        System.out.println(imgPaths);
        request.setAttribute("imgPath",imgPaths);
        //4.转发到list.jsp
        request.getRequestDispatcher("houtaigl/other_fun/lunbotu.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
