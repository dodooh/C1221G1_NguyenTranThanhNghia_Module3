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
        } else if (serviceData.getPoolArea() <= 0) {
            error.put("pool_area", "Area Must Be Larger Than 0");
        }
        if (serviceData.getArea() == null) {
            error.put("area", "Area Is Invalid");
        } else if (serviceData.getArea() <= 0) {
            error.put("area", "Area Must Be Larger Than 0");
        }
        if (serviceData.getPrice() == null) {
            error.put("price", "Price Is Invalid");
        } else if (serviceData.getPrice() <= 0) {
            error.put("price", "Price Must Be Larger Than 0");
        }
        if (serviceData.getMaxPeopleAllowed() == null) {
            error.put("people_allowed", "MaxPeopleAllowed Is Invalid");
        } else if (serviceData.getMaxPeopleAllowed() <= 0) {
            error.put("people_allowed", "MaxPeopleAllowed Must Be Larger Than 0");
        }
        if (serviceData.getRentTypeId() == null) {
            error.put("rent_type_id", "RentTypeId Is Invalid");
        }
        if (serviceData.getServiceTypeId() == null) {
            error.put("service_type_id", "Service Type Id Is Invalid");
        }
        if (serviceData.getServiceName().length() == 0) {
            error.put("service_name", "Service Must Have Name");
        }
        if (serviceData.getPoolArea() == null && serviceData.getServiceTypeId() == 1) {
            error.put("pool_area", "Pool Area Invalid");
        }
        if (serviceData.getNumFloors() == null && serviceData.getServiceTypeId() == 2) {
            error.put("floors", "Floors Invalid");
        }

        // santinizier
        if (error.isEmpty()) {
            if (serviceData.getStandardRoom().length() == 0) {
                serviceData.setStandardRoom(null);
            }
            if (serviceData.getConvenientDescribe().length() == 0) {
                serviceData.setConvenientDescribe(null);
            }
            iServiceDataRepository.insertOne(serviceData);
        }
        System.out.println("error size: " + error.size());
        return error;
    }
}
