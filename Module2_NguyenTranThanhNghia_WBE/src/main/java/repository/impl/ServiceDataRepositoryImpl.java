package repository.impl;

import java.sql.SQLException;
import java.util.List;
import model.ServiceData;
import repository.IServiceDataRepository;

public class ServiceDataRepositoryImpl implements IServiceDataRepository {
    private BaseRepository baseRepository = BaseRepository.getInstance();

    @Override
    public List<ServiceData> selectAll() {
        return null;
    }

    @Override
    public void insertOne(ServiceData serviceData) {

    }

    @Override
    public ServiceData findById(int id) {
        return null;
    }

    @Override
    public void updateOne(ServiceData serviceData) {

    }

    @Override
    public void deleteOne(Integer id) {

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
