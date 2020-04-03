package web.Servlet.ht;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@WebServlet("/htlanmu")
public class HtlanmuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        UserService service = new UserServiceImpl();

        List<Lanmu> lanmus = service.getLanmu();

        session.setAttribute("lms",lanmus);
        //4.转发到list.jsp
        request.getRequestDispatcher("/houtaigl/main/pageadmin.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
