package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public Map<String, String> insertOne(ServiceData serviceData) {
        Map<String, String> error = new HashMap<>();
        if (!serviceData.getServiceCode().matches("^DV-\\d{4}$")) {
            error.put("service_code", "Service Code Invalid");
        }
        if (serviceData.getPoolArea() == null) {
            error.put("pool_area", "Pool Area Is Invalid");
        } if (serviceData.getPoolArea() <= 0) {
            error.put("pool_area", "Area Must Be Larger Than 0");
        }
        if (serviceData.getArea() == null) {
            error.put("area", "Area Is Invalid");
        } if (serviceData.getArea() <= 0) {
            error.put("area", "Area Must Be Larger Than 0");
        }

        if (error.isEmpty()) {
            iServiceDataRepository.insertOne(serviceData);
        }
        System.out.println("error size: " +  error.size());
        return error;
    }
}
