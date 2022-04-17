package service.impl;

import java.util.List;
import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerRepositoryImpl;
import repository.impl.CustomerTypeRepository;
import service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();
    ICustomerTypeRepository iCustomerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAll();
    }
    @Override
    public List<CustomerType> selectAllCustomerType() {
        return iCustomerTypeRepository.selectAll();
    }
}
