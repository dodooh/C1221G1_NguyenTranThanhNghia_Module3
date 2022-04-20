package service.impl;

import repository.IServiceDataRepository;
import repository.impl.ServiceDataRepositoryImpl;
import service.IServiceDataService;

public class ServiceDataServiceImpl implements IServiceDataService {
    IServiceDataRepository iServiceDataRepository = new ServiceDataRepositoryImpl();
}
