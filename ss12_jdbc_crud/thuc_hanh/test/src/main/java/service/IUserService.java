package service;

import java.util.List;
import model.User;

public interface IUserService {

    List<User> findAll();

    List<User> search(String keyword);
}
