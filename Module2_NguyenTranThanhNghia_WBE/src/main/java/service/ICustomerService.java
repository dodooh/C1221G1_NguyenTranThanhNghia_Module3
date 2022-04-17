package service;

import java.util.List;
import model.Customer;
import model.CustomerType;

public interface ICustomerService {
    List<Customer> selectAllCustomer();
    List<CustomerType> selectAllCustomerType();
}
