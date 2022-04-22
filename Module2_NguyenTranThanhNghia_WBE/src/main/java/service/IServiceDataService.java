package service;

import java.util.List;
import java.util.Map;
import model.Customer;
import model.ServiceData;

public interface IServiceDataService {
    List<ServiceData> selectAllServiceData();

    Map<String, String> insertOne(ServiceData serviceData);
}
