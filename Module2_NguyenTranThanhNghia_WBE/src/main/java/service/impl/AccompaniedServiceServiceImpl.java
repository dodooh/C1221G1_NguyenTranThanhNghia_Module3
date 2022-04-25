package service.impl;

import java.util.List;
import model.AccompaniedService;
import repository.impl.AccompaniedServiceRepositoryImpl;
import service.IAccompaniedServiceService;

public class AccompaniedServiceServiceImpl implements IAccompaniedServiceService {

    @Override
    public List<AccompaniedService> selectAllAccompaniedService() {
        return new AccompaniedServiceRepositoryImpl().selectAll();
    }
}
