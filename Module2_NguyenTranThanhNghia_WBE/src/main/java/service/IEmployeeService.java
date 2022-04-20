package service;

import java.util.List;
import model.Employee;

public interface IEmployeeService {

    List<Employee> selectAllEmployee();

    void insertOne(Employee employee);

    Employee findById(int id);

    void updateOne(Employee employee);

    void deleteEmployee(Integer idToDelete);

    List<Employee> search(String name, String phone, String mail);
}
