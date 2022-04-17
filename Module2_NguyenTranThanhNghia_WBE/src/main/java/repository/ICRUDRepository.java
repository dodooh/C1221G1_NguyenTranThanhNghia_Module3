package repository;

import java.util.List;

public interface ICRUDRepository<E> {
    List<E> selectAll();
}
