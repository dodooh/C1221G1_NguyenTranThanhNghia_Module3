package repository;

import dto.ContractDTO;
import java.util.List;
import model.Contract;

public interface IContractRepository {

    List<ContractDTO> selectAll();

    void insertOne(Contract contract);
}
