package repository.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import repository.ICustomerRepository;

public class CustomerRepositoryImpl implements ICustomerRepository {

    private BaseRepository baseRepository = BaseRepository.getInstance();

    private static final String SELECT_ALL_CUSTOMERS_SQL = "select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer";
    private static final String FIND_CUSTOMER_BY_ID_SQL = "select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "update furama_resort.customer set customer_name = ?, date_of_birth = ?, gender = ?, identify_number = ?, phone_number = ?, email = ?, address = ?, customer_type_id = ? where customer_id = ?";
    private static final String DELETE_CUSTOMER_SQL = "delete from furama_resort.customer where customer_id = ?";
    private static final String INSERT_CUSTOMERS_SQL = "INSERT INTO furama_resort.customer (customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ? );";
    private static final String SEARCH_CUSTOMERS_SQL = "select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer where customer_name LIKE ? and phone_number LIKE ? and email LIKE ?";


    public CustomerRepositoryImpl() {
    }


    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = baseRepository.getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS_SQL);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            Customer customer = null;
            while (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerDob(rs.getString("date_of_birth"));
                customer.setCustomerGender(rs.getInt("gender"));
                customer.setCustomerIdCard(rs.getString("identify_number"));
                customer.setCustomerPhone(rs.getString("phone_number"));
                customer.setCustomerMail(rs.getString("email"));
                customer.setCustomerAddress(rs.getString("address"));
                customer.setCustomerTypeId(rs.getInt("customer_type_id"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }

    @Override
    public void insertOne(Customer customer) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS_SQL)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setDate(2, Date.valueOf(customer.getCustomerDob()));
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerMail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Customer findById(int id) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER_BY_ID_SQL);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerDob(rs.getString("date_of_birth"));
                customer.setCustomerGender(rs.getInt("gender"));
                customer.setCustomerIdCard(rs.getString("identify_number"));
                customer.setCustomerPhone(rs.getString("phone_number"));
                customer.setCustomerMail(rs.getString("email"));
                customer.setCustomerAddress(rs.getString("address"));
                customer.setCustomerTypeId(rs.getInt("customer_type_id"));
                return customer;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
    }

    @Override
    public void updateOne(Customer customer) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setDate(2, Date.valueOf(customer.getCustomerDob()));
            preparedStatement.setInt(3, customer.getCustomerGender());
            preparedStatement.setString(4, customer.getCustomerIdCard());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerMail());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.setInt(8, customer.getCustomerTypeId());
            preparedStatement.setInt(9, customer.getCustomerId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void deleteOne(Integer id) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public List<Customer> search(String keyword, String phone, String mail) {
        List<Customer> customerList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = baseRepository.getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMERS_SQL);) {
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, "%" + phone + "%");
            preparedStatement.setString(3, "%" + mail + "%");
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            Customer customer = null;
            while (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerDob(rs.getString("date_of_birth"));
                customer.setCustomerGender(rs.getInt("gender"));
                customer.setCustomerIdCard(rs.getString("identify_number"));
                customer.setCustomerPhone(rs.getString("phone_number"));
                customer.setCustomerMail(rs.getString("email"));
                customer.setCustomerAddress(rs.getString("address"));
                customer.setCustomerTypeId(rs.getInt("customer_type_id"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }
}
