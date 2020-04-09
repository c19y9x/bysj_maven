package domain;

public class Admin {
    /**
     * id唯一标识，用于在数据库中删除
     * admin_id 用户名，本来应该改成admin_name的，但是做了很多了不好改了
     * password 密码
     * authority 权限控制，0指超级管理员，拥有最高权限。2-8为各个板块的编辑权
     */
    private int id;
    private String admin_id;
    private String password;
    private int authority;

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id='" + admin_id + '\'' +
                ", password='" + password + '\'' +
                ", id=" + id +
                ", authority=" + authority +
                '}';
    }
}
