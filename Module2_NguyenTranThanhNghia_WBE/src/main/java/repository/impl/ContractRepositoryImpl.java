package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.ContractDTO;
import model.Contract;
import repository.IContractRepository;

public class ContractRepositoryImpl implements IContractRepository {

    private final BaseRepository baseRepository = BaseRepository.getInstance();
    private static final String SELECT_ALL_SERVICE_DATA_SQL =
        "select contract_id, created_date, end_date, deposit, staff_name, customer_name, service_name "
            + "from contract left join staff s on s.staff_id = contract.staff_id "
            + "left join customer c on c.customer_id = contract.customer_id "
            + "left join service s2 on contract.service_id = s2.service_id";
    private static final String INSERT_SERVICE_SQL = "INSERT INTO contract (created_date, end_date, deposit, staff_id, customer_id, service_id) values (?,?,?,?,?,?);";

    //    @Override
//    public List<Contract> selectAll() {
//        List<Contract> contractList = new ArrayList<>();
//        try (Connection connection = baseRepository.getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_DATA_SQL);) {
//            ResultSet rs = preparedStatement.executeQuery();
//            Contract contract = null;
//            while (rs.next()) {
//                contract = new Contract();
//                contract.setContractId(rs.getInt("contract_id"));
//                contract.setCreateDate(rs.getString("created_date"));
//                contract.setEndDate(rs.getString("end_date"));
//                contract.setDeposit(rs.getDouble("deposit"));
//                contract.setEmployeeId(rs.getInt("staff_id"));
//                contract.setCustomerId(rs.getInt("customer_id"));
//                contract.setServiceId(rs.getInt("service_id"));
//                contractList.add(contract);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return contractList;
//    }
    @Override
    public List<ContractDTO> selectAll() {
        List<ContractDTO> contractList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_DATA_SQL);) {
            ResultSet rs = preparedStatement.executeQuery();
            ContractDTO contract = null;
            while (rs.next()) {
                contract = new ContractDTO();
                contract.setContractId(rs.getInt("contract_id"));
                contract.setCreateDate(rs.getString("created_date"));
                contract.setEndDate(rs.getString("end_date"));
                contract.setDeposit(rs.getDouble("deposit"));
                contract.setEmployeeName(rs.getString("staff_name"));
                contract.setCustomerName(rs.getString("customer_name"));
                contract.setServiceName(rs.getString("service_name"));
                contractList.add(contract);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
    public void insertOne(Contract contract) {
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_SQL);) {
            preparedStatement.setString(1, contract.getCreateDate());
            preparedStatement.setString(2, contract.getEndDate());
            preparedStatement.setDouble(3, contract.getDeposit());
            preparedStatement.setInt(4, contract.getEmployeeId());
            preparedStatement.setInt(5, contract.getCustomerId());
            preparedStatement.setInt(6, contract.getServiceId());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
