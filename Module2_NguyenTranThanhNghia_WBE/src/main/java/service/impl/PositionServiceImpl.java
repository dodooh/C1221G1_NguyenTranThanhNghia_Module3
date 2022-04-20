package service.impl;

import java.util.List;
import model.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepositoryImpl;
import service.IPositionService;

public class PositionServiceImpl implements IPositionService {
    private IPositionRepository iPositionRepository = new PositionRepositoryImpl();

    @Override
    public List<Position> selectAllPosition() {
        return iPositionRepository.selectAll();
    }
}
