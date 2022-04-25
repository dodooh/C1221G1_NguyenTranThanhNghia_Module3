package repository;

import java.util.List;
import model.Product;

public interface ICRUDRepository {
    List<Product> selectAll();

    boolean insertOne(Product product);

    Product findById(Integer customerId);

    boolean deleteOne(Integer customerId);
}
