package repository.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CustomerType;
import repository.ICustomerTypeRepository;

public class CustomerTypeRepositoryImpl implements ICustomerTypeRepository {

    private static final String SELECT_ALL_CUSTOMER_TYPES = "select customer_type_id, customer_type_name from furama_resort.customer_type";
    private BaseRepository baseRepository = BaseRepository.getInstance();

    @Override
    public List<CustomerType> selectAll() {
        List<CustomerType> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPES)) {
            ResultSet rs = preparedStatement.executeQuery();
            CustomerType customerType = null;
            while (rs.next()) {
                customerType = new CustomerType();
                customerType.setCustomerTypeId(rs.getInt("customer_type_id"));
                customerType.setCustomerTypeName(rs.getString("customer_type_name"));
                customerList.add(customerType);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
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
}
