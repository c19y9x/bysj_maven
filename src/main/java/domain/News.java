package domain;

import java.util.Date;

public class News {
    private int id;
    private String title;
    private String content;
    private Date add_time;
    private int lid;
    private int zlid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Date add_time) {
        this.add_time = add_time;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getZlid() {
        return zlid;
    }

    public void setZlid(int zlid) {
        this.zlid = zlid;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", add_time=" + add_time +
                ", lid=" + lid +
                ", zlid=" + zlid +
                '}';
    }
}
