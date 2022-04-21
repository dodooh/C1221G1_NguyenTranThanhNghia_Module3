package service.impl;

import java.util.List;
import model.ServiceData;
import repository.IServiceDataRepository;
import repository.impl.ServiceDataRepositoryImpl;
import service.IServiceDataService;

public class ServiceDataServiceImpl implements IServiceDataService {
    IServiceDataRepository iServiceDataRepository = new ServiceDataRepositoryImpl();

    @Override
    public List<ServiceData> selectAllServiceData() {
        return iServiceDataRepository.selectAll();
    }

    @Override
    public void insertOne(ServiceData serviceData) {
        iServiceDataRepository.insertOne(serviceData);
    }
}
