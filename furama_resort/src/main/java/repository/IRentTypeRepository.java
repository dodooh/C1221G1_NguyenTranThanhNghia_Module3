package repository;

import java.util.List;
import model.RentType;

public interface IRentTypeRepository {
    List<RentType> selectAll();
}
