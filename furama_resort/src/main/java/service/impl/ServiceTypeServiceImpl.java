package service.impl;

import java.util.List;
import model.ServiceType;
import repository.IServiceTypeRepository;
import repository.impl.ServiceTypeRepositoryImpl;
import service.IServiceTypeService;

public class ServiceTypeServiceImpl implements IServiceTypeService {
    private final IServiceTypeRepository iServiceTypeRepository = new ServiceTypeRepositoryImpl();
    @Override
    public List<ServiceType> selectAllServiceType() {
        return iServiceTypeRepository.selectAll();
    }
}
