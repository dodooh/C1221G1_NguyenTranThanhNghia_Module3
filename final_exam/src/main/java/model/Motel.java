package model;

public class Motel {
    private String motelId;
    private String customerName;
    private String phoneNumber;
    private String dayRent;
    private Integer rentTypeId;
    private String note;

    @Override
    public String toString() {
        return "Motel{" +
            "motelId='" + motelId + '\'' +
            ", customerName='" + customerName + '\'' +
            ", phoneNumber='" + phoneNumber + '\'' +
            ", dayRent='" + dayRent + '\'' +
            ", rentTypeId=" + rentTypeId +
            ", note='" + note + '\'' +
            '}';
    }

    public Motel(String motelId, String customerName, String phoneNumber, String dayRent, Integer rentTypeId, String note) {
        this.motelId = motelId;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.dayRent = dayRent;
        this.rentTypeId = rentTypeId;
        this.note = note;
    }

    public Motel() {
    }

    public String getMotelId() {
        return motelId;
    }

    public void setMotelId(String motelId) {
        this.motelId = motelId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDayRent() {
        return dayRent;
    }

    public void setDayRent(String dayRent) {
        this.dayRent = dayRent;
    }

    public Integer getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(Integer rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
