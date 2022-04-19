package service;

import java.util.List;
import model.User;
import repository.IUserRepository;
import repository.UserRepositoryImpl;

public class UserServiceImpl implements IUserService{
    private IUserRepository iUserRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public List<User> search(String keyword) {
        return iUserRepository.search(keyword);
    }
}
