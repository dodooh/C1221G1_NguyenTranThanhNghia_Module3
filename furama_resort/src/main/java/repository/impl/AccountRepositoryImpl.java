package repository.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import repository.IAccountRepository;

public class AccountRepositoryImpl implements IAccountRepository {

    private final BaseRepository baseRepository = BaseRepository.getInstance();

    private final String CHECK_LOGIN_SQL = "select username, password, role, name from furama_resort.account where username = ? and password = ?;";

    @Override
    public Account checkLogin(String user, String pwd) {
        Account account = null;
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_LOGIN_SQL);) {
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pwd);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                account = new Account(
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("name"),
                    rs.getInt("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
}
