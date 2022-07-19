package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RentType;
import repository.IRentTypeRepository;

public class RentTypeRepositoryImpl implements IRentTypeRepository {
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static String SELECT_ALL_RENT_TYPE = "select rent_type_id, rent_type_name from final_m3.rent_type";

    @Override
    public List<RentType> selectAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE)) {
            ResultSet rs = preparedStatement.executeQuery();
            RentType rentType = null;
            while (rs.next()) {
                rentType = new RentType();
                rentType.setRentTypeId(rs.getInt("rent_type_id"));
                rentType.setRentTypeName(rs.getString("rent_type_name"));
                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rentTypeList;
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
