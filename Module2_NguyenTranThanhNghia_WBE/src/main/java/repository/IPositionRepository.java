package repository;

import java.util.List;
import model.Position;

public interface IPositionRepository {

    List<Position> selectAll();
}
