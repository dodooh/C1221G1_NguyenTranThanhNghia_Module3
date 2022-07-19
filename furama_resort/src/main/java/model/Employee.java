package model;

public class Employee {

    private Integer employeeId;
    private String employeeName;
    private String employeeDob;
    private String employeeIdCard;
    private Double employeeSalary;
    private String employeePhone;
    private String employeeMail;
    private String employeeAddress;
    private Integer employeePositionId;
    private Integer employeeEducationDegreeId;
    private Integer employeeDivisionId;

    public Employee() {
    }

    public Employee(Integer employeeId, String employeeName, String employeeDob, String employeeIdCard, Double employeeSalary,
        String employeePhone, String employeeMail, String employeeAddress, Integer employeePositionId, Integer employeeEducationDegreeId,
        Integer employeeDivisionId) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeDob = employeeDob;
        this.employeeIdCard = employeeIdCard;
        this.employeeSalary = employeeSalary;
        this.employeePhone = employeePhone;
        this.employeeMail = employeeMail;
        this.employeeAddress = employeeAddress;
        this.employeePositionId = employeePositionId;
        this.employeeEducationDegreeId = employeeEducationDegreeId;
        this.employeeDivisionId = employeeDivisionId;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeDob() {
        return employeeDob;
    }

    public void setEmployeeDob(String employeeDob) {
        this.employeeDob = employeeDob;
    }

    public String getEmployeeIdCard() {
        return employeeIdCard;
    }

    public void setEmployeeIdCard(String employeeIdCard) {
        this.employeeIdCard = employeeIdCard;
    }

    public Double getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(Double employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeMail() {
        return employeeMail;
    }

    public void setEmployeeMail(String employeeMail) {
        this.employeeMail = employeeMail;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }

    public Integer getEmployeePositionId() {
        return employeePositionId;
    }

    public void setEmployeePositionId(Integer employeePositionId) {
        this.employeePositionId = employeePositionId;
    }

    public Integer getEmployeeEducationDegreeId() {
        return employeeEducationDegreeId;
    }

    public void setEmployeeEducationDegreeId(Integer employeeEducationDegreeId) {
        this.employeeEducationDegreeId = employeeEducationDegreeId;
    }

    public Integer getEmployeeDivisionId() {
        return employeeDivisionId;
    }

    public void setEmployeeDivisionId(Integer employeeDivisionId) {

        this.employeeDivisionId = employeeDivisionId;
    }

    @Override
    public String toString() {
        return "Employee{" +
            "employeeId=" + employeeId +
            ", employeeName='" + employeeName + '\'' +
            ", employeeDob='" + employeeDob + '\'' +
            ", employeeIdCard='" + employeeIdCard + '\'' +
            ", employeeSalary=" + employeeSalary +
            ", employeePhone='" + employeePhone + '\'' +
            ", employeeMail='" + employeeMail + '\'' +
            ", employeeAddress='" + employeeAddress + '\'' +
            ", employeePositionId=" + employeePositionId +
            ", employeeEducationDegreeId=" + employeeEducationDegreeId +
            ", employeeDivisionId=" + employeeDivisionId +
            '}';
    }
}
