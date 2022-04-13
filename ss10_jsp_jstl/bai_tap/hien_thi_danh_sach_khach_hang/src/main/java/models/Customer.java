package models;

public class Customer {
    private String name;
    private int gender;
    private String dob;
    private String address;
    private double score;
    private String imgSrc;
    private int customerTypeID;

    public Customer(String name, int gender, String dob, String address, double score, String imgSrc, int customerTypeID) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.score = score;
        this.imgSrc = imgSrc;
        this.customerTypeID = customerTypeID;
    }

    public int getCustomerTypeID() {
        return customerTypeID;
    }

    public void setCustomerTypeID(int customerTypeID) {
        this.customerTypeID = customerTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }
}
