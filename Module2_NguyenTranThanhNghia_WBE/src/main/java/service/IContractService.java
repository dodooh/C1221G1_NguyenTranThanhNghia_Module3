package service;

import dto.ContractDTO;
import java.util.List;
import model.Contract;

public interface IContractService {

    void insertOne(Contract contract);

    List<ContractDTO> selectAllContractDTO();
}
