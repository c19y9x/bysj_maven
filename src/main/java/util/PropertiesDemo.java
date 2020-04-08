package util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

public class PropertiesDemo {
    public static final Properties p = new Properties();
    public static final String path = "ipConfig.properties";
    //初始化
    public static void init() {
        //转换成流
        InputStream inputStream =
                PropertiesDemo.class.getClassLoader().getResourceAsStream(path);
        try {
            //从输入流中读取属性列表（键和元素对）
            p.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //获取
    public static String get(String key) {
        return p.getProperty(key);
    }
    //修改或者新增
    public static void update(String key, String value) {
        p.setProperty(key, value);
        FileOutputStream oFile = null;
        try {
            oFile = new FileOutputStream(path);
            //将Properties中的属性列表（键和元素对）写入输出流
            p.store(oFile, "");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                oFile.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //根据键删除
    public static void delete(String key) {
        p.remove(key);
        FileOutputStream oFile = null;
        try {
            oFile = new FileOutputStream(path);
            p.store(oFile, "");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                oFile.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //获取所有key value
    public static void list() {
        Enumeration en = p.propertyNames(); //得到配置文件的名字
        System.out.println("ssss");
        while(en.hasMoreElements()) {
            String strKey = (String) en.nextElement();
            String strValue = p.getProperty(strKey);
            System.out.println(strKey + "=" + strValue);
        }
    }

    public static void main(String[] args) {
        PropertiesDemo.init();
        System.out.println(PropertiesDemo.get("allowIP"));
    }

}
