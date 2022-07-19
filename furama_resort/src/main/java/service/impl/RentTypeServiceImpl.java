package service.impl;

import java.util.List;
import model.RentType;
import repository.IRentTypeRepository;
import repository.impl.RentTypeRepositoryImpl;
import service.IRentTypeService;

public class RentTypeServiceImpl implements IRentTypeService {
    private final IRentTypeRepository iRentTypeService = new RentTypeRepositoryImpl();
    @Override
    public List<RentType> selectAllRentType() {
        return iRentTypeService.selectAll();
    }
}
