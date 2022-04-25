package service.impl;

import java.util.List;
import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

public class ProductServiceImpl implements IProductService {
    private final IProductRepository iProductRepository = new ProductRepositoryImpl();


    @Override
    public List<Product> selectAllProduct() {
        return iProductRepository.selectAll();
    }

    @Override
    public boolean insertOne(Product product) {
        return iProductRepository.insertOne(product);
    }

    @Override
    public Product findById(Integer customerId) {
        return iProductRepository.findById(customerId);
    }

    @Override
    public void deleteCustomer(Integer customerId) {
        iProductRepository.deleteOne(customerId);
    }
}
