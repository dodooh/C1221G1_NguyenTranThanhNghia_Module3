package repository;

import java.util.List;
import model.Department;
import model.Position;

public interface IDepartmentRepository {
    List<Department> selectAll();

}
