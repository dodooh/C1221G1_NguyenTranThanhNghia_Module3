package service.impl;

import dto.ContractDTO;
import java.util.List;
import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepositoryImpl;
import service.IContractService;

public class ContractServiceImpl implements IContractService {
    private final IContractRepository iContractRepository = new ContractRepositoryImpl();

    @Override
    public void insertOne(Contract contract) {
        iContractRepository.insertOne(contract);
    }

    @Override
    public List<ContractDTO> selectAllContractDTO() {
        return iContractRepository.selectAllContractDTO();
    }

    @Override
    public List<Contract> selectAllContract() {
        return iContractRepository.selectAllContract();
    }
}
