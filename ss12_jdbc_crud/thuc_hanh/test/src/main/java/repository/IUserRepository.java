package repository;

import java.util.List;
import model.User;

public interface IUserRepository extends ICRUDRepository{

    List<User> search(String keyword);
}
