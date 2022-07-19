package repository;

import java.util.List;
import model.AccompaniedService;
import model.ServiceData;

public interface IAccompaniedServiceRepository {
    List<AccompaniedService> selectAll();
}
