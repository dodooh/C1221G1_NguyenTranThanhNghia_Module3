package service;

import java.util.List;
import java.util.Map;
import model.Customer;

public interface ICustomerService {

    List<Customer> selectAllCustomer();

    Map<String, String> insertOne(Customer customer);

    Customer findById(int id);

    Map<String, String> updateOne(Customer customer);

    void deleteCustomer(Integer id);

    List<Customer> search(String keyword, String phone, String mail);
}
