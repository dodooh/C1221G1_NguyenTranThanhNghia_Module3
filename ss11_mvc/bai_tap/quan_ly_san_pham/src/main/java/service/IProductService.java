package service;

import java.util.List;
import java.util.Map;

public interface IProductService<Product> {
    List<Product> getListProduct();
    Map<String, String> save(Product product);
    Product findById(int id);
    Map<String, String> update(int id, Product product);
    void remove(int index);
}
