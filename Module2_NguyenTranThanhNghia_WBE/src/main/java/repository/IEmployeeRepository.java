package repository;

import java.util.List;
import model.Customer;
import model.Employee;

public interface IEmployeeRepository extends ICRUDRepository<Employee> {
    List<Employee> search(String keyword, String phone, String mail);

}
