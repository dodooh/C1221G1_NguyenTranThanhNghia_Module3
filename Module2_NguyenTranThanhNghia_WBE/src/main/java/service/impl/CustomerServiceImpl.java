package service.impl;

import java.util.List;
import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerRepositoryImpl;
import repository.impl.CustomerTypeRepositoryImpl;
import service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAll();
    }


    @Override
    public void insertOne(Customer customer) {
        iCustomerRepository.insertOne(customer);
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public void updateOne(Customer customer) {
        iCustomerRepository.updateOne(customer);
    }

    @Override
    public void deleteCustomer(Integer id) {
        iCustomerRepository.deleteOne(id);
    }

    @Override
    public List<Customer> search(String keyword, String phone, String mail) {
        return iCustomerRepository.search(keyword, phone, mail);
    }
}
