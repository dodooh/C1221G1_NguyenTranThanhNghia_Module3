package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ServiceType;
import repository.IServiceTypeRepository;

public class ServiceTypeRepositoryImpl implements IServiceTypeRepository {
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_SERVICE_TYPE = "select service_type_id, service_type_name from furama_resort.service_type";

    @Override
    public List<ServiceType> selectAll() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE)) {
            ResultSet rs = preparedStatement.executeQuery();
            ServiceType serviceType = null;
            while (rs.next()) {
                serviceType = new ServiceType();
                serviceType.setServiceTypeId(rs.getInt("service_type_id"));
                serviceType.setServiceTypeName(rs.getString("service_type_name"));
                serviceTypeList.add(serviceType);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return serviceTypeList;
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
