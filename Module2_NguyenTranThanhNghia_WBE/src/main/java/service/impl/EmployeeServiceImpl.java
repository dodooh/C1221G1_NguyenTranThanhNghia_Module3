package service.impl;

import java.util.List;
import model.Customer;
import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {

    private final IEmployeeRepository iEmployeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> selectAllEmployee() {
        return iEmployeeRepository.selectAll();
    }


    @Override
    public void insertOne(Employee employee) {
        iEmployeeRepository.insertOne(employee);
    }

    @Override
    public Employee findById(int id) {
        return iEmployeeRepository.findById(id);
    }

    @Override
    public void updateOne(Employee employee) {
        iEmployeeRepository.updateOne(employee);
    }

    @Override
    public void deleteEmployee(Integer idToDelete) {
        iEmployeeRepository.deleteOne(idToDelete);
    }

    @Override
    public List<Employee> search(String name, String phone, String mail) {
        return iEmployeeRepository.search(name, phone, mail);
    }


}
