package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import model.ServiceData;
import repository.IServiceDataRepository;

public class ServiceDataRepositoryImpl implements IServiceDataRepository {
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_SERVICE_DATA_SQL = "select service_id,service_code, service_name, area, price, max_people_allowed, room_standard, convenient_describe, pool_area, floors, rent_type_id, service_type_id from furama_resort.service;";
    private static final String INSERT_SERVICE_DATA_SQL = "insert into furama_resort.service (service_code,service_name, area, price, max_people_allowed, room_standard, convenient_describe, pool_area, floors, rent_type_id, service_type_id) values (?,?,?,?,?,?,?,?,?,?,?) ;";

    @Override
    public List<ServiceData> selectAll() {
        List<ServiceData> serviceDataList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_DATA_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            ServiceData serviceData = null;
            while (rs.next()) {
                serviceData = new ServiceData();
//"select service_id, service_name, area, price, max_people_allowed, room_standard, convenient_describe, pool_area, floors, rent_type_id, service_type_id from furama_resort.service;";
                serviceData.setServiceId(rs.getInt("service_id"));
                serviceData.setServiceCode(rs.getString("service_code"));
                serviceData.setServiceName(rs.getString("service_name"));
                serviceData.setArea(rs.getInt("area"));
                serviceData.setPrice(rs.getDouble("price"));
                serviceData.setMaxPeopleAllowed(rs.getInt("max_people_allowed"));
                serviceData.setStandardRoom(rs.getString("room_standard"));
                serviceData.setConvenientDescribe(rs.getString("convenient_describe"));
                serviceData.setPoolArea(rs.getDouble("pool_area"));
                serviceData.setNumFloors(rs.getInt("floors"));
                serviceData.setRentTypeId(rs.getInt("rent_type_id"));
                serviceData.setServiceTypeId(rs.getInt("service_type_id"));
                serviceDataList.add(serviceData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceDataList;
    }

    @Override
    public void insertOne(ServiceData serviceData) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_DATA_SQL);) {

            preparedStatement.setString(1, serviceData.getServiceCode());
            preparedStatement.setString(2, serviceData.getServiceName());
            preparedStatement.setInt(3, serviceData.getArea());
            preparedStatement.setDouble(4, serviceData.getPrice());
            preparedStatement.setInt(5, serviceData.getMaxPeopleAllowed());
            preparedStatement.setString(6, serviceData.getStandardRoom());
            preparedStatement.setString(7, serviceData.getConvenientDescribe());
            preparedStatement.setObject(8, serviceData.getPoolArea());
            preparedStatement.setObject(9, serviceData.getNumFloors());
            preparedStatement.setInt(10, serviceData.getRentTypeId());
            preparedStatement.setInt(11, serviceData.getServiceTypeId());
            boolean result = preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
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

}
