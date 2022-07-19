package repository.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Motel;
import repository.IMotelRepository;

public class MotelRepositoryImpl implements IMotelRepository {
    private static final String SEARCH_CUSTOMER_ADDITION_SQL = "select id_motel, customer_name, phone, day_rent, rent_type_id, note from final_m3.motel where customer_name LIKE ? and phone LIKE ? and CAST(id_motel as CHAR) LIKE ?";
    private static final String DELETE_MOTEL_SQL = "delete from final_m3.motel where id_motel = ?";
    private static final String FIND_MOTEL_BY_ID_SQL = "SELECT * FROM final_m3.motel where id_motel = ?";
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_MOTEL_SQL = "select id_motel, customer_name, phone, day_rent, rent_type_id, note from final_m3.motel;";
    private static final String INSERT_MOTE_SQL = "INSERT INTO final_m3.motel (customer_name, phone, day_rent, rent_type_id, note) VALUES (?,?, ?, ?, ?);";

    @Override
    public List<Motel> selectAll() {
        List<Motel> motelList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MOTEL_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            Motel motel = null;
            while (rs.next()) {
                motel = new Motel();
                motel.setMotelId(rs.getString("id_motel"));
                motel.setCustomerName(rs.getString("customer_name"));
                motel.setPhoneNumber(rs.getString("phone"));
                motel.setDayRent(rs.getString("day_rent"));
                motel.setRentTypeId(rs.getInt("rent_type_id"));
                motel.setNote(rs.getString("note"));
                motelList.add(motel);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return motelList;
    }

    @Override
    public void insertOne(Motel motel) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MOTE_SQL)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setString(1, motel.getCustomerName());
            preparedStatement.setString(2, motel.getPhoneNumber());
            preparedStatement.setDate(3, Date.valueOf(motel.getDayRent()));
            preparedStatement.setInt(4, motel.getRentTypeId());
            preparedStatement.setString(5, motel.getNote());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean findById(Integer motelId) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_MOTEL_BY_ID_SQL);) {
            preparedStatement.setInt(1, motelId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return false;
    }

    @Override
    public void deleteOne(Integer motelId) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MOTEL_SQL)) {
            preparedStatement.setInt(1, motelId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<Motel> search(String motelId, String customerName, String phone) {
        List<Motel> motelList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_ADDITION_SQL);) {
            preparedStatement.setString(1, "%" + customerName + "%");
            preparedStatement.setString(2, "%" + phone + "%");
            preparedStatement.setString(3, "%" + motelId + "%");
            ResultSet rs = preparedStatement.executeQuery();
            Motel motel = null;
            while (rs.next()) {
                motel = new Motel();
                motel.setMotelId(rs.getString("id_motel"));
                motel.setCustomerName(rs.getString("customer_name"));
                motel.setPhoneNumber(rs.getString("phone"));
                motel.setDayRent(rs.getString("day_rent"));
                motel.setRentTypeId(rs.getInt("rent_type_id"));
                motel.setNote(rs.getString("note"));
                motelList.add(motel);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return motelList;
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
