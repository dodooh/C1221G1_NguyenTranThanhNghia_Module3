package model;

public class Contract {
    private Integer contractId;
    private String createDate;
    private String endDate;
    private Double deposit;
    private Integer employeeId;
    private Integer customerId;
    private Integer serviceId;

    @Override
    public String toString() {
        return "Contract{" +
            "contractId=" + contractId +
            ", createDate='" + createDate + '\'' +
            ", endDate='" + endDate + '\'' +
            ", deposit=" + deposit +
            ", employeeId=" + employeeId +
            ", customerId=" + customerId +
            ", serviceId=" + serviceId +
            '}';
    }

    public Contract(Integer contractId, String createDate, String endDate, Double deposit, Integer employeeId, Integer customerId,
        Integer serviceId) {
        this.contractId = contractId;
        this.createDate = createDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.serviceId = serviceId;
    }

    public Contract() {

    }

    public Integer getContractId() {
        return contractId;
    }

    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }
}
