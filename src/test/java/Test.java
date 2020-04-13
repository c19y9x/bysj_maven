import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
    public static void main(String[] args) {
        String str = delHTMLTag("<p style=\"margin-top: 0px;margin-bottom: 0px;padding: 0px;font-family: 宋体;line-height: 1.8em;color: rgb(85, 85, 85);text-indent: 30px;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"font-size: 20px\">（通讯员：沈言）</span><span style=\"font-family: calibri;font-size: 20px\">2019</span><span style=\"font-size: 20px\">年</span><span style=\"font-family: calibri;font-size: 20px\">3</span><span style=\"font-size: 20px\">月</span><span style=\"font-family: calibri;font-size: 20px\">18</span><span style=\"font-size: 20px\">日上午，校党委委员、副校长龙先琼教授、校学生工作部欧阳大文部长一行到物理与机电工程学院指导学生工作。院党委书记熊文斌、院长彭金璋及原院党委副书记现学院党建组织员程安垣分别汇报了学院的学生工作。</span></p><p style=\"margin-top: 0px;margin-bottom: 0px;padding: 0px;font-family: 宋体;line-height: 1.8em;color: rgb(85, 85, 85);font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><br/></p><p style=\";padding: 0px;font-family: 宋体;line-height: 1.8em;color: rgb(85, 85, 85);text-align: justify;font-size: 14px;white-space: normal;background-color: rgb(255, 255, 255)\"><span style=\"font-size: 20px\">&nbsp; &nbsp;龙副校长肯定了学院学生工作，并就下一步学院的学生工作提出了六点要求：一是要重视学生信息员工作，随时掌握学生思想动态和需求；二是要重视学风建设，要持续深化，久久为功；三是要重视大学生互联网</span><span style=\"font-size: 20px\">+</span><span style=\"font-size: 20px\">和挑战杯大赛，教师要参与进来，加强指导，以赛促学；四是要重视意识形态工作，切实抓好学生的思想政治工作，同时，要重视“两籍学生”的“一对一”帮扶；五是要做好“三全育人”工作，开展相关研究，力求育人效果；六是加强师德师风建设，争做新时代“四有”老师。</span></p><p><br/></p>");
        //String str1 = SearchFocus(str,"学生");
        int a = str.indexOf("学生");
        str = str.substring(a , str.length());
        System.out.println(str);
    }
    public static List<String> split(String str,String start,String end){
        List<String> list=new ArrayList<String>();
        while (true) {
            int a = str.indexOf(start);
            if (a < 0)
                break;
            str = str.substring(a + start.length(), str.length());
            int b = str.indexOf(end);
            if (b < 0)
                break;
            String ss = str.substring(0, b);
            list.add(ss);
            str = str.substring(b + end.length(), str.length());
        }
        return list;

    }


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

    public static String SearchFocus(String HTMLStr , String SearchContent){
        String str = delHTMLTag(HTMLStr);
        Pattern pattern = Pattern.compile(SearchContent);
        Matcher matcher = pattern.matcher(str);
        str = matcher.replaceAll("<span style='color:#dd4b39'>"+SearchContent+"</span>");
        return str.trim();
    }

}
