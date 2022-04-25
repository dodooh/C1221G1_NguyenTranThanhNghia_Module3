package dto;

public class ContractDetailDTO {
    private Integer contractDetailId;
    private Integer quantity;
    private Integer contractId;
    private String createDate;
    private String endDate;
    private Double deposit;
    private String employeeName;
    private String customerName;
    private String serviceName;
    private String asName;

    public ContractDetailDTO(Integer contractDetailId, Integer quantity, Integer contractId, String createDate, String endDate, Double deposit,
        String employeeName, String customerName, String serviceName, String asName) {
        this.contractDetailId = contractDetailId;
        this.quantity = quantity;
        this.contractId = contractId;
        this.createDate = createDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.employeeName = employeeName;
        this.customerName = customerName;
        this.serviceName = serviceName;
        this.asName = asName;
    }

    public ContractDetailDTO() {
    }

    public Integer getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(Integer contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getAsName() {
        return asName;
    }

    public void setAsName(String asName) {
        this.asName = asName;
    }
}
