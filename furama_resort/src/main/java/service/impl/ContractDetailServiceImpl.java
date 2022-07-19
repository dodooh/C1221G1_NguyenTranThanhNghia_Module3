package service.impl;

import dto.ContractDetailDTO;
import java.util.List;
import model.ContractDetail;
import repository.impl.ContractDetailRepositoryImpl;
import service.IContractDetailService;

public class ContractDetailServiceImpl implements IContractDetailService {

    @Override
    public List<ContractDetail> selectAllContractDetail() {
        return new ContractDetailRepositoryImpl().selectAll();
    }

    @Override
    public List<ContractDetailDTO> selectAllContractDetailDTO() {
        return new ContractDetailRepositoryImpl().selectAllDTO();
    }

    @Override
    public void insertOne(ContractDetail contractDetail) {
        new ContractDetailRepositoryImpl().insertOne(contractDetail);
    }
}
