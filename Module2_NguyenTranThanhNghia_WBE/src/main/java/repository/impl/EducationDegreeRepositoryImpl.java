package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.EducationDegree;
import model.Position;
import repository.IEducationDegreeRepository;

public class EducationDegreeRepositoryImpl implements IEducationDegreeRepository {
    private BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_EDUCATION_DEGREE = "select education_degree_id, education_degree_name from furama_resort.education_degree";

    @Override
    public List<EducationDegree> selectAll() {
        List<EducationDegree> educationDegrees = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            EducationDegree educationDegree = null;
            while (rs.next()) {
                educationDegree = new EducationDegree();
                educationDegree.setEducationDegreeId(rs.getInt("education_degree_id"));
                educationDegree.setEducationDegreeName(rs.getString("education_degree_name"));
                educationDegrees.add(educationDegree);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return educationDegrees;
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
