package model;

public class RentType {
    private Integer rentTypeId;
    private String rentTypeName;

    public RentType() {
    }

    public RentType(Integer rentTypeId, String rentTypeName) {
        this.rentTypeId = rentTypeId;
        this.rentTypeName = rentTypeName;
    }

    public Integer getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(Integer rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }
}
