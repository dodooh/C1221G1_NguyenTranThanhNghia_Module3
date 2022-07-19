package service;

import dto.ContractDetailDTO;
import java.util.List;
import model.ContractDetail;

public interface IContractDetailService {
    List<ContractDetail> selectAllContractDetail();
    List<ContractDetailDTO> selectAllContractDetailDTO();

    void insertOne(ContractDetail contractDetail);
}
