package dao;

import domain.Lanmu;
import domain.News;

import java.util.List;

public interface UserDao {
    public List<Lanmu> getLanmu();

    public List<News> getSynews();
}
