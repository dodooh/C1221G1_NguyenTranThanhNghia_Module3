package service.impl;

import java.util.List;
import model.EducationDegree;
import repository.IEducationDegreeRepository;
import repository.impl.EducationDegreeRepositoryImpl;
import service.IEducationDegreeService;

public class EducationDegreeServiceImpl implements IEducationDegreeService {
    private IEducationDegreeRepository iEducationDegreeRepository = new EducationDegreeRepositoryImpl();

    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        return iEducationDegreeRepository.selectAll();
    }
}
