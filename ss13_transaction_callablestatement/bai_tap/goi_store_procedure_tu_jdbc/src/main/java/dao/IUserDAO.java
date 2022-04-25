package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {

    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    List<User> findByCountry(String country);

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> sort(String by, boolean isDESC);

    void addUserTransaction(User user, int[] permision);

    void insertUpdateWithoutTransaction();
    void insertUpdateUseTransaction();



}
