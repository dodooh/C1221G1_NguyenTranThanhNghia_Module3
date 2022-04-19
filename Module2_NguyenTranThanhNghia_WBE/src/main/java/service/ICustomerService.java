package service;

import java.util.List;
import model.Customer;
import model.CustomerType;

public interface ICustomerService {
    List<Customer> selectAllCustomer();
    List<CustomerType> selectAllCustomerType();
    void insertOne(Customer customer);

    Customer findById(int id);

    void updateOne(Customer customer);

    void deleteCustomer(Integer id);

    List<Customer> search(String keyword);
}
