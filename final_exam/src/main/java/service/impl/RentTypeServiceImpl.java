package service.impl;

import java.util.List;
import model.RentType;
import repository.impl.RentTypeRepositoryImpl;
import service.IRentTypeService;

public class RentTypeServiceImpl implements IRentTypeService {

    @Override
    public List<RentType> selectAllRentType() {
        return new RentTypeRepositoryImpl().selectAll();
    }
}
