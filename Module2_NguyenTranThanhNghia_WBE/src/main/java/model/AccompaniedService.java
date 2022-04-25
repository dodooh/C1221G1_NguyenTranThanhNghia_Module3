package model;

public class AccompaniedService {
    private Integer accId;
    private String accName;
    private Double price;
    private String unit;
    private String status;

    public AccompaniedService(Integer accId, String accName, Double price, String unit, String status) {
        this.accId = accId;
        this.accName = accName;
        this.price = price;
        this.unit = unit;
        this.status = status;
    }

    public AccompaniedService() {
    }

    public Integer getAccId() {
        return accId;
    }

    public void setAccId(Integer accId) {
        this.accId = accId;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
