package tech.unimart.unimart.model;

import java.util.Date;

public class Forgot {
    private String id;
    private Date time;
    private String userId;

    public Forgot() {
    }

    public Forgot(String id, Date time, String userId) {
        this.id = id;
        this.time = time;
        this.userId = userId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
