package domain;

import java.util.List;

public class ShouyeContent {
    private String title;
    private List<News> news;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<News> getNews() {
        return news;
    }

    public void setNews(List<News> news) {
        this.news = news;
    }

    @Override
    public String toString() {
        return "ShouyeContent{" +
                "title='" + title + '\'' +
                ", news=" + news +
                '}';
    }
}
