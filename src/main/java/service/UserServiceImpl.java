package service;

import dao.UserDao;
import dao.UserDaoImpl;
import domain.Lanmu;
import domain.News;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();
    @Override
    //获取所有的栏目
    public List<Lanmu> getLanmu() {
        return dao.getLanmu();
    }

    @Override
    public List<News> getSynews() {
        return dao.getSynews();
    }
}
