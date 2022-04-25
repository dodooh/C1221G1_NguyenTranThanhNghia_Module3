package repository;

import dto.ContractDTO;
import java.util.List;
import model.Contract;

public interface IContractRepository {

    List<ContractDTO> selectAllContractDTO();

    void insertOne(Contract contract);

    List<Contract> selectAllContract();
}
