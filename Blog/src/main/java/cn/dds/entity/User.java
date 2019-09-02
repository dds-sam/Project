package cn.dds.entity;

public class User {
    private int user_id;
    private String user_name;
    private String user_password;
    private int user_state;
    private String user_email;
    private String user_headimage;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public int getUser_state() {
        return user_state;
    }

    public void setUser_state(int user_state) {
        this.user_state = user_state;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_headimage() {
        return user_headimage;
    }

    public void setUser_headimage(String user_headimage) {
        this.user_headimage = user_headimage;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_state=" + user_state +
                ", user_email='" + user_email + '\'' +
                ", user_headimage='" + user_headimage + '\'' +
                '}';
    }
}
