package repository;

import java.util.List;
import model.Customer;

public interface ICRUDRepository<E> {
    List<E> selectAll();
    void insertOne(E e);
}
