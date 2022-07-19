package repository;

import java.util.List;
import model.ServiceType;

public interface IServiceTypeRepository {
    List<ServiceType> selectAll();
}
