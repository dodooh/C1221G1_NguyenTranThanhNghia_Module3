package repository;

import java.util.List;
import model.ServiceData;

public interface IServiceDataRepository {
    List<ServiceData> selectAll();
    void insertOne(ServiceData serviceData);
}
