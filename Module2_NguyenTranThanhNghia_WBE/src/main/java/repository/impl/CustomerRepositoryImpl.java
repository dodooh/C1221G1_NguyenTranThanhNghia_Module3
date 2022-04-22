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

    private static final String SEARCH_CUSTOMER_ADDITION_SQL =     "select customer_code, customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer where customer_name LIKE ? and phone_number LIKE ? and CAST(customer_type_id as CHAR) LIKE ?";
    private static final String SELECT_ALL_CUSTOMERS_SQL = "select customer_id, customer_code, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer";
    private static final String FIND_CUSTOMER_BY_ID_SQL = "select customer_id,customer_code, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "update furama_resort.customer set customer_code = ?, customer_name = ?, date_of_birth = ?, gender = ?, identify_number = ?, phone_number = ?, email = ?, address = ?, customer_type_id = ? where customer_id = ?";
    private static final String DELETE_CUSTOMER_SQL = "delete from furama_resort.customer where customer_id = ?";
    private static final String INSERT_CUSTOMERS_SQL = "INSERT INTO furama_resort.customer (customer_code,customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id) VALUES (?,?, ?, ?, ?, ?, ?, ?, ? );";
    private static final String SEARCH_CUSTOMERS_SQL = "select customer_code, customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from furama_resort.customer where customer_name LIKE ? and phone_number LIKE ? and email LIKE ?";
    private BaseRepository baseRepository = BaseRepository.getInstance();


    public CustomerRepositoryImpl() {
    }


    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            Customer customer = null;
            while (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerCode(rs.getString("customer_code"));
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
            preparedStatement.setString(1, customer.getCustomerCode());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setDate(3, Date.valueOf(customer.getCustomerDob()));
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerMail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerTypeId());
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
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerCode(rs.getString("customer_code"));
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
            preparedStatement.setString(1, customer.getCustomerCode());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setDate(3, Date.valueOf(customer.getCustomerDob()));
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerMail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, customer.getCustomerTypeId());
            preparedStatement.setInt(10, customer.getCustomerId());
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
            preparedStatement.setInt(1, id);
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
    public List<Customer> search(String keyword, String phone, String customerType) {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_ADDITION_SQL);) {
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, "%" + phone + "%");
            preparedStatement.setString(3, customerType);
            ResultSet rs = preparedStatement.executeQuery();
            Customer customer = null;
            while (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerCode(rs.getString("customer_code"));
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
