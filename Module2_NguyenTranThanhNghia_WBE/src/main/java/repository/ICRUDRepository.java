package repository;

import java.util.List;
import model.Customer;
import model.Employee;

public interface ICRUDRepository<E> {
    List<E> selectAll();
    void insertOne(E e);

    E findById(int id);

    void updateOne(E e);

    void deleteOne(Integer id);
}
