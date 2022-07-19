package model;

public class Account {

    private String username;
    private String password;
    private String name;
    private Integer role;

    public Account(String username, String password, String name, Integer role) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.role = role;
    }

    public Account() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
