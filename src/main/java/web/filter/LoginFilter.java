package web.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/houtaigl")
public class LoginFilter implements Filter{
/*    //实例化一个静态的集合(这里可以改用map集合，提高性能，每次过滤可以不用for匹配)
    private static List<String> urls = new ArrayList<>();
    //静态代码块中向集合中存放所有可以放行的请求或网页地址（不用账号密码即可访问）
    static {
        urls.add("/ueditor");
        urls.add("/img");
        urls.add("/frame");
        urls.add("/fonts");
        urls.add("/css");
        urls.add("/index.jsp");
        urls.add("/erji_content.jsp");
        urls.add("/erji_bt.jsp");
        urls.add("/shouye");
        urls.add("/erjiServlet");
        urls.add("/newServlet");
        urls.add("/htlogin");
    }*/

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }


    /**
     * 拦截请求，看看用户是否登陆，如果没有登陆，
     * 则跳转回登录页面，否则就放行
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        //注意：ServletRequest是HttpServletRequest父接口,因此需要强转
        //同样，ServletResponse是HttpServletResponse父接口,因此需要强转

        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        //得到当前页面所在目录下全名称
        String urlPattern=req.getServletPath();
        //得到页面所在服务器的绝对路径
        String path = req.getRequestURI();
        /*System.out.println(urlPattern);
        System.out.println(path);
        System.out.println(((HttpServletRequest) request).getContextPath());*/
        //System.out.println(urlPattern);
/*        for (String url : urls) {
            if(url.equals(urlPattern) || path.contains(url)) {
                //System.out.println("reaource do chain...");
                chain.doFilter(request, response);
                //防止重复响应
                return;
            }
        }*/
        //如果person为null，表示没有登录
        if(req.getSession().getAttribute("admin")==null) {
            request.setAttribute("login_msg","您尚未登录，请登录");
            request.getRequestDispatcher("htlogin").forward(req,response);

        }else {
            //放行
            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}