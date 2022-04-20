package repository;

import java.util.List;
import model.EducationDegree;
import model.Position;

public interface IEducationDegreeRepository {

    List<EducationDegree> selectAll();
}
