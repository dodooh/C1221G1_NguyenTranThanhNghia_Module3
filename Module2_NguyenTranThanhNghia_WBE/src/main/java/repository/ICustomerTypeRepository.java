package repository;

import java.util.List;
import model.Customer;
import model.CustomerType;

public interface ICustomerTypeRepository {
    List<CustomerType> selectAll();
}
