package model;

public class ContractDetail {
    private Integer contractDetailId;
    private Integer quantity;
    private Integer contractId;
    private Integer asId;

    @Override
    public String toString() {
        return "ContractDetail{" +
            "contractDetailId=" + contractDetailId +
            ", quantity=" + quantity +
            ", contractId=" + contractId +
            ", asId=" + asId +
            '}';
    }

    public ContractDetail(Integer contractDetailId, Integer quantity, Integer contractId, Integer asId) {
        this.contractDetailId = contractDetailId;
        this.quantity = quantity;
        this.contractId = contractId;
        this.asId = asId;
    }

    public ContractDetail() {
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

    public Integer getAsId() {
        return asId;
    }

    public void setAsId(Integer asId) {
        this.asId = asId;
    }
}
