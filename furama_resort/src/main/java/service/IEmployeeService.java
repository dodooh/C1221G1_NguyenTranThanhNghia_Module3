package service;

import java.util.List;
import java.util.Map;
import model.Employee;

public interface IEmployeeService {

    List<Employee> selectAllEmployee();

    Map<String, String> insertOne(Employee employee);

    Employee findById(int id);

    void updateOne(Employee employee);

    void deleteEmployee(Integer idToDelete);

    List<Employee> search(String name, String phone, String mail);
}
