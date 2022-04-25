package service;

import java.util.List;
import model.Product;

public interface IProductService {

    List<Product> selectAllProduct();

    boolean insertOne(Product product);

    Product findById(Integer customerId);

    void deleteCustomer(Integer customerId);
}
