package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import repository.IEmployeeRepository;

public class EmployeeRepositoryImpl implements IEmployeeRepository {

    private static final String SELECT_ALL_EMPLOYEES_SQL = "select staff_id, staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id, department_id from staff";
    private static final String FIND_EMPLOYEE_BY_ID_SQL = "select staff_id, staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id, department_id from staff where staff_id = ?";
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO furama_resort.staff (staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id, department_id) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_EMPLOYEE_SQL = "update furama_resort.staff set staff_name = ?, date_of_birth = ?, identify_number = ?, salary = ?, phone_number = ?, email = ?, address = ?, position_id = ?, education_degree_id = ?, department_id = ? where staff_id = ?";
    private static final String DELETE_EMPLOYEE_SQL = "delete from furama_resort.staff where staff_id = ?";
    private static final String SEARCH_EMPLOYEE_SQL = "select staff_id, staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id, department_id from staff where staff_name LIKE ? and date_of_birth between ? and ?";
    private BaseRepository baseRepository = BaseRepository.getInstance();

    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            Employee employee = null;
            while (rs.next()) {
                employee = new Employee();
                employee.setEmployeeId(rs.getInt("staff_id"));
                employee.setEmployeeName(rs.getString("staff_name"));
                employee.setEmployeeDob(rs.getString("date_of_birth"));
                employee.setEmployeeIdCard(rs.getString("identify_number"));
                employee.setEmployeeSalary(rs.getDouble("salary"));
                employee.setEmployeePhone(rs.getString("phone_number"));
                employee.setEmployeeMail(rs.getString("email"));
                employee.setEmployeeAddress(rs.getString("address"));
                employee.setEmployeePositionId(rs.getInt("position_id"));
                employee.setEmployeeEducationDegreeId(rs.getInt("education_degree_id"));
                employee.setEmployeeDivisionId(rs.getInt("department_id"));
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void insertOne(Employee employee) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeDob());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeMail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeEducationDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
            boolean result = preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee findById(int id) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_EMPLOYEE_BY_ID_SQL);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                Employee employee = new Employee();
                employee.setEmployeeId(rs.getInt("staff_id"));
                employee.setEmployeeName(rs.getString("staff_name"));
                employee.setEmployeeDob(rs.getString("date_of_birth"));
                employee.setEmployeeIdCard(rs.getString("identify_number"));
                employee.setEmployeeSalary(rs.getDouble("salary"));
                employee.setEmployeePhone(rs.getString("phone_number"));
                employee.setEmployeeMail(rs.getString("email"));
                employee.setEmployeeAddress(rs.getString("address"));
                employee.setEmployeePositionId(rs.getInt("position_id"));
                employee.setEmployeeEducationDegreeId(rs.getInt("education_degree_id"));
                employee.setEmployeeDivisionId(rs.getInt("department_id"));
                return employee;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return null;
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
    public void updateOne(Employee employee) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeDob());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeMail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeEducationDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
            preparedStatement.setInt(11, employee.getEmployeeId());
            boolean result = preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOne(Integer id) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<Employee> search(String keyword, String startDate, String endDate) {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, startDate);
            preparedStatement.setString(3, endDate);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            Employee employee = null;
            while (rs.next()) {
                employee = new Employee();
                employee.setEmployeeId(rs.getInt("staff_id"));
                employee.setEmployeeName(rs.getString("staff_name"));
                employee.setEmployeeDob(rs.getString("date_of_birth"));
                employee.setEmployeeIdCard(rs.getString("identify_number"));
                employee.setEmployeeSalary(rs.getDouble("salary"));
                employee.setEmployeePhone(rs.getString("phone_number"));
                employee.setEmployeeMail(rs.getString("email"));
                employee.setEmployeeAddress(rs.getString("address"));
                employee.setEmployeePositionId(rs.getInt("position_id"));
                employee.setEmployeeEducationDegreeId(rs.getInt("education_degree_id"));
                employee.setEmployeeDivisionId(rs.getInt("department_id"));
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }
}
