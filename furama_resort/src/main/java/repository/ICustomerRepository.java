package repository;

import java.util.List;
import model.Customer;

public interface ICustomerRepository extends ICRUDRepository<Customer> {

    List<Customer> search(String keyword, String phone, String customerType);
}
