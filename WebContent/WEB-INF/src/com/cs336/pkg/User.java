package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    public int id;
    public String username;
    public String password;
    public String accountCreated;
    public String dob;
    public String address;
    public String phoneNum;
    public String email;
    public int type;

    public User(int id, String username, String password, String accountCreated, String dob, String address,
            String phoneNum, String email, int type) {
        this.username = username;
        this.id = id;
        this.password = password;
        this.accountCreated = accountCreated;
        this.dob = dob;
        this.address = address;
        this.phoneNum = phoneNum;
        this.email = email;
        this.type = type;
    }

    public User(ResultSet rs) throws SQLException {
        this.username = rs.getString("Username");
        this.id = rs.getInt("UserID");
        this.password = rs.getString("Password");
        this.accountCreated = rs.getString("AccountCreated");
        this.dob = rs.getString("DOB");
        this.address = rs.getString("Address");
        this.phoneNum = rs.getString("PhoneNum");
        this.email = rs.getString("Email");
        this.type = rs.getInt("Type");
    }

}
