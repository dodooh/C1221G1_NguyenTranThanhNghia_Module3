package repository.impl;

import dto.ContractDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ContractDetail;
import repository.IContractDetailRepository;

public class ContractDetailRepositoryImpl implements IContractDetailRepository {
    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private final String INSERT_CONTRACT_DETAIL_DATA_SQL = "insert into contract_detail (quantity, contract_id,accompanied_service_id) VALUES (?,?,?);";

    private final String SELECT_ALL_CONTRACT_DETAIL_SQL = "select contract_detail_id, quantity, contract_id, accompanied_service_id from contract_detail;";
    private final String SELECT_ALL_CONTRACT_DETAIL_DTO_SQL = "select cd.contract_detail_id, cd.quantity, c.contract_id, c.created_date, c.end_date, c.deposit, s.staff_name, c2.customer_name, s2.service_name, `as`.accompanied_service_name as asname "
        + "from contract_detail cd "
        + "left join accompanied_service `as` on `as`.accompanied_service_id = cd.accompanied_service_id "
        + "left join contract c on cd.contract_id = c.contract_id "
        + "left join customer c2 on c.customer_id = c2.customer_id "
        + "left join staff s on c.staff_id = s.staff_id "
        + "left join service s2 on c.service_id = s2.service_id";
    @Override
    public List<ContractDetail> selectAll() {
        List<ContractDetail> contractDetails = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            ContractDetail contractDetail = null;
            while (rs.next()) {
                contractDetail = new ContractDetail();
                contractDetail.setContractDetailId(rs.getInt("contract_detail_id"));
                contractDetail.setQuantity(rs.getInt("quantity"));
                contractDetail.setContractId(rs.getInt("contract_id"));
                contractDetail.setAsId(rs.getInt("accompanied_service_id"));
                contractDetails.add(contractDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetails;
    }

    @Override
    public List<ContractDetailDTO> selectAllDTO() {
        List<ContractDetailDTO> contractDetailDTOS = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL_DTO_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            ContractDetailDTO contractDetailDTO = null;
            while (rs.next()) {
                contractDetailDTO = new ContractDetailDTO();
                contractDetailDTO.setContractDetailId(rs.getInt(1));
                contractDetailDTO.setQuantity(rs.getInt(2));
                contractDetailDTO.setContractId(rs.getInt(3));
                contractDetailDTO.setCreateDate(rs.getString(4));
                contractDetailDTO.setEndDate(rs.getString(5));
                contractDetailDTO.setDeposit(rs.getDouble(6));
                contractDetailDTO.setEmployeeName(rs.getString(7));
                contractDetailDTO.setCustomerName(rs.getString(8));
                contractDetailDTO.setServiceName(rs.getString(9));
                contractDetailDTO.setAsName(rs.getString(10));
                contractDetailDTOS.add(contractDetailDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailDTOS;
    }

    @Override
    public void insertOne(ContractDetail contractDetail) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_DETAIL_DATA_SQL);) {

            preparedStatement.setInt(1, contractDetail.getContractId());
            preparedStatement.setInt(2, contractDetail.getQuantity());
            preparedStatement.setInt(3, contractDetail.getAsId());
            boolean result = preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
