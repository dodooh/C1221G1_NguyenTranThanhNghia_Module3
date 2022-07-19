package repository;

import dto.ContractDetailDTO;
import java.util.List;
import model.ContractDetail;
import model.CustomerType;

public interface IContractDetailRepository {
    List<ContractDetail> selectAll();
    List<ContractDetailDTO> selectAllDTO();

    void insertOne(ContractDetail contractDetail);
}
