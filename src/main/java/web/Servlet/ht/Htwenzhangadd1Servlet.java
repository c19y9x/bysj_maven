package web.Servlet.ht;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.News;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

//添加文章
@WebServlet("/htwenzhangadd1")
public class Htwenzhangadd1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //获取参数
        Map<String, String[]> map = request.getParameterMap();

        News new1 =new News();
        try {
            DateConverter converter = new DateConverter();
            converter.setPattern(new String("yyyy-MM-dd"));
            ConvertUtils.register(converter, Date.class);
            BeanUtils.populate(new1,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(new1);
        UserService service = new UserServiceImpl();
        service.addNew(new1);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),null);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
