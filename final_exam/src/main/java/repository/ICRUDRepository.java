package repository;

import java.util.List;
import model.Motel;

public interface ICRUDRepository<E> {

    List<E> selectAll();

    void insertOne(Motel motel);

    boolean findById(Integer motelId);

    void deleteOne(Integer motelId);

    List<Motel> search(String motelId, String customerName, String phone);
}
