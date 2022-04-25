package repository;

import java.util.List;
import model.Product;

public interface ICrudRepository<E> {
    List<E> getList();
    void save(E e);
    void update(int old, Product product);
    void remove(int index);
}
