package service;

import java.util.List;
import model.Customer;
import model.Department;
import model.EducationDegree;
import model.Employee;
import model.Position;

public interface IEmployeeService {

    List<Employee> selectAllEmployee();

    void insertOne(Employee employee);

    Employee findById(int id);
}
