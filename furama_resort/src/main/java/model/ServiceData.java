package model;

public class ServiceData {
    private Integer serviceId;
    private String serviceCode;
    private String serviceName;
    private Integer area;
    private Double price;
    private Integer maxPeopleAllowed;
    private String standardRoom;
    private String convenientDescribe;
    private Double poolArea;
    private Integer numFloors;
    private Integer rentTypeId;
    private Integer serviceTypeId;

    public ServiceData(Integer serviceId, String serviceCode, String serviceName, Integer area, Double price, Integer maxPeopleAllowed,
        String standardRoom, String convenientDescribe, Double poolArea, Integer numFloors, Integer rentTypeId, Integer serviceTypeId) {
        this.serviceId = serviceId;
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.area = area;
        this.price = price;
        this.maxPeopleAllowed = maxPeopleAllowed;
        this.standardRoom = standardRoom;
        this.convenientDescribe = convenientDescribe;
        this.poolArea = poolArea;
        this.numFloors = numFloors;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
    }

    public ServiceData() {
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getMaxPeopleAllowed() {
        return maxPeopleAllowed;
    }

    public void setMaxPeopleAllowed(Integer maxPeopleAllowed) {
        this.maxPeopleAllowed = maxPeopleAllowed;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getConvenientDescribe() {
        return convenientDescribe;
    }

    public void setConvenientDescribe(String convenientDescribe) {
        this.convenientDescribe = convenientDescribe;
    }

    public Double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(Double poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getNumFloors() {
        return numFloors;
    }

    public void setNumFloors(Integer numFloors) {
        this.numFloors = numFloors;
    }

    public Integer getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(Integer rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    @Override
    public String toString() {
        return "ServiceData{" +
            "serviceId=" + serviceId +
            ", serviceCode='" + serviceCode + '\'' +
            ", serviceName='" + serviceName + '\'' +
            ", area=" + area +
            ", price=" + price +
            ", maxPeopleAllowed=" + maxPeopleAllowed +
            ", standardRoom='" + standardRoom + '\'' +
            ", convenientDescribe='" + convenientDescribe + '\'' +
            ", poolArea=" + poolArea +
            ", numFloors=" + numFloors +
            ", rentTypeId=" + rentTypeId +
            ", serviceTypeId=" + serviceTypeId +
            '}';
    }
}
