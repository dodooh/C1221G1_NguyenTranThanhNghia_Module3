package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserRepositoryImpl implements IUserRepository{

    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym@2022";

    private static String SELECT_ALL_USERS = "select `id`,`name`,email,country from users;";
    private static String DELETE_USERS = "delete from users where id = ?";
    private static String Search_USERS =  "select `id`,`name`,email,country from users where `name` LIKE ?;";



    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void deleteUser(int id) {
////        /. mo cong ket noi
//        Connection connection = getConnection();
//        // truy vaans
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS);
//            preparedStatement.setInt(1, id);
//            System.out.println(preparedStatement);
//            // thay doi thuoc tinh cua bang dun executeUpdate()
//            preparedStatement.executeUpdate();
//
////            rs.next() => Kiem tra con record hay khong
////            rs.get => lay tung entity (thuoc tinh) cua record
//
//            User user = null;
//            while (rs.next()) {
//                user = new User();
//                user.setId(rs.getInt("id"));
//                user.setName(rs.getString("name"));
//                user.setEmail(rs.getString("email"));
//                user.setCountry(rs.getString("country"));
//                userList.add(user);
//            }
//            System.out.println(userList.size());
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
    }
    @Override
    public List<User> findAll() {
        // mo cong ket noi
        List<User> userList = new ArrayList<>();
        Connection connection = getConnection();
        // truy vaans
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = preparedStatement.executeQuery();

//            rs.next() => Kiem tra con record hay khong
//            rs.get => lay tung entity (thuoc tinh) cua record

            User user = null;
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setCountry(rs.getString("country"));
                userList.add(user);
            }
            System.out.println(userList.size());

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return userList;
        /// dong ket noi
    }

    @Override
    public List<User> search(String keyword) {
        // mo cong ket noi
        List<User> userList = new ArrayList<>();
        Connection connection = getConnection();
        // truy vaans
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(Search_USERS);
//            select `id`,`name`,email,country from users where `name` LIKE %m%
            preparedStatement.setString(1, "%" + keyword + "%");

            ResultSet rs = preparedStatement.executeQuery();

//            rs.next() => Kiem tra con record hay khong
//            rs.get => lay tung entity (thuoc tinh) cua record

            User user = null;
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setCountry(rs.getString("country"));
                userList.add(user);
            }
            System.out.println(userList.size());

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return userList;
    }
}
