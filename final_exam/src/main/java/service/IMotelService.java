package service;

import java.util.List;
import java.util.Map;
import model.Motel;

public interface IMotelService {
    List<Motel> selectAllMotel();

    void insertOne(Motel motel);

    Map<String, String> validate(Motel motel);

    boolean findById(Integer motelId);

    void deleteCustomer(Integer motelId);

    List<Motel> search(String motelId, String customerName, String phone);
}
