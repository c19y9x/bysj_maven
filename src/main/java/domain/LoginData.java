package domain;

import java.util.Date;

public class LoginData {
    private int id;
    private String admin_id;
    private Date logintime;
    private String ip;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Override
    public String toString() {
        return "LoginData{" +
                "id=" + id +
                ", admin_id='" + admin_id + '\'' +
                ", logintime=" + logintime +
                ", ip='" + ip + '\'' +
                '}';
    }
}
