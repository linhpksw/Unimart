package tech.unimart.unimart.model;

import java.util.Date;

public class Remember {
    private int id;
    private String userId;
    private String token;
    private Date expirationDate;

    public Remember() {
    }

    public Remember(int id, String userId, String token, Date expirationDate) {
        this.id = id;
        this.userId = userId;
        this.token = token;
        this.expirationDate = expirationDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }
}
