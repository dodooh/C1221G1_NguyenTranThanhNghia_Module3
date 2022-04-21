package service;

import java.util.List;
import model.Customer;
import model.ServiceData;

public interface IServiceDataService {
    List<ServiceData> selectAllServiceData();

    void insertOne(ServiceData serviceData);
}
