package service.impl;

import java.util.List;
import model.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypeRepositoryImpl;
import service.ICustomerTypeService;

public class CustomerTypeServiceImpl implements ICustomerTypeService {

    ICustomerTypeRepository iCustomerTypeRepository = new CustomerTypeRepositoryImpl();

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return iCustomerTypeRepository.selectAll();
    }
}
