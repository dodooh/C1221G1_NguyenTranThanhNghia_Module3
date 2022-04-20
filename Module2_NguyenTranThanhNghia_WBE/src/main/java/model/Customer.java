package model;

public class Customer {

    private Integer customerId;
    private String customerName;
    private String customerDob;
    private Integer customerGender;
    private String customerIdCard;
    private String customerPhone;
    private String customerMail;
    private String customerAddress;
    private Integer customerTypeId;

    public Customer() {
    }

    public Customer(Integer customerId, String customerName, String customerDob, Integer customerGender, String customerIdCard,
        String customerPhone, String customerMail, String customerAddress, Integer customerTypeId) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerDob = customerDob;
        this.customerGender = customerGender;
        this.customerIdCard = customerIdCard;
        this.customerPhone = customerPhone;
        this.customerMail = customerMail;
        this.customerAddress = customerAddress;
        this.customerTypeId = customerTypeId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerDob() {
        return customerDob;
    }

    public void setCustomerDob(String customerDob) {
        this.customerDob = customerDob;
    }

    public Integer getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(Integer customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerIdCard() {
        return customerIdCard;
    }

    public void setCustomerIdCard(String customerIdCard) {
        this.customerIdCard = customerIdCard;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerMail() {
        return customerMail;
    }

    public void setCustomerMail(String customerMail) {
        this.customerMail = customerMail;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public Integer getCustomerTypeId() {
        return customerTypeId;
    }

    ;

    public void setCustomerTypeId(Integer customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    @Override
    public String toString() {
        return "Customer{" +
            "customerId=" + customerId +
            ", customerName='" + customerName + '\'' +
            ", customerDob='" + customerDob + '\'' +
            ", customerGender=" + customerGender +
            ", customerIdCard='" + customerIdCard + '\'' +
            ", customerPhone='" + customerPhone + '\'' +
            ", customerMail='" + customerMail + '\'' +
            ", customerAddress='" + customerAddress + '\'' +
            ", customerTypeId=" + customerTypeId +
            '}';
    }
}
