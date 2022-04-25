package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.AccompaniedService;
import repository.IAccompaniedServiceRepository;

public class AccompaniedServiceRepositoryImpl implements IAccompaniedServiceRepository {
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_ACCOMPANIED_SERVICE_SQL = "select accompanied_service_id, accompanied_service_name, price, unit, status from accompanied_service";

    @Override
    public List<AccompaniedService> selectAll() {
        List<AccompaniedService> accompaniedServices = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOMPANIED_SERVICE_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            AccompaniedService accompaniedService = null;
            while (rs.next()) {
                accompaniedService = new AccompaniedService();
                accompaniedService.setAccId(rs.getInt("accompanied_service_id"));
                accompaniedService.setAccName(rs.getString("accompanied_service_name"));
                accompaniedService.setPrice(rs.getDouble("price"));
                accompaniedService.setUnit(rs.getString("unit"));
                accompaniedService.setStatus(rs.getString("status"));
                accompaniedServices.add(accompaniedService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accompaniedServices;
    }
}
