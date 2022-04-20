package service.impl;

import java.util.List;
import model.Department;
import repository.IDepartmentRepository;
import repository.impl.DepartmentRepositoryImpl;
import service.IDepartmentService;

public class DepartmentServiceImpl implements IDepartmentService {
    private IDepartmentRepository iDepartmentRepository = new DepartmentRepositoryImpl();
    @Override
    public List<Department> selectAllDepartment() {
        return iDepartmentRepository.selectAll();
    }
}
