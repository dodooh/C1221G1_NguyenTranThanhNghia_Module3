package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CustomerType;
import model.Position;
import repository.IPositionRepository;

public class PositionRepositoryImpl implements IPositionRepository {
    private BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_POSITION = "select position_id, position_name from furama_resort.position";


    @Override
    public List<Position> selectAll() {
        List<Position> positionList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            Position position = null;
            while (rs.next()) {
                position = new Position();
                position.setPositionId(rs.getInt("position_id"));
                position.setPositionName(rs.getString("position_name"));
                positionList.add(position);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return positionList;
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
