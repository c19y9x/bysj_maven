package web.Servlet;

import domain.Lanmu;
import domain.News;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/newSearch")
public class NewSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String new_key = request.getParameter("new_key");

        UserService service = new UserServiceImpl();
        List<News> news_search = service.getNewsForSearch(new_key);
        for(News news:news_search){
            news.setContent(SearchFocus(news.getContent(),new_key));
        }
        List<Lanmu> lanmus = service.getLanmu();
        request.setAttribute("news",news_search);
        //主栏目栏
        request.setAttribute("lm",lanmus);
        request.getRequestDispatcher("search.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    //将HTML内容转化为纯文本内容
    public static String delHTMLTag(String htmlStr) {
        String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式
        String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式
        String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式

        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(htmlStr);
        htmlStr = m_script.replaceAll(""); //过滤script标签

        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(htmlStr);
        htmlStr = m_style.replaceAll(""); //过滤style标签

        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(htmlStr);
        htmlStr = m_html.replaceAll(""); //过滤html标签

        return htmlStr.trim(); //返回文本字符串
    }

    /**
     * 去除搜索内容之前的文本，并给搜索内容加格式
     * @param HTMLStr
     * @param SearchContent
     * @return
     */
    public static String SearchFocus(String HTMLStr , String SearchContent){
        String str = delHTMLTag(HTMLStr);
        int a = str.indexOf(SearchContent);
        str = str.substring(a , str.length());
        Pattern pattern = Pattern.compile(SearchContent);
        Matcher matcher = pattern.matcher(str);
        str = matcher.replaceAll("<span style='color:#dd4b39'>"+SearchContent+"</span>");
        return str.trim();
    }
}
