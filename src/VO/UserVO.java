package VO;

public class UserVO{


    private int uuid;
    private String tell;
    private String name;
    private String pw;
    private int permission;// 1: 비로그인, 2: 로그인(회원), 3:로그인(프리미엄) ,10: 관리자
    private int point;

    public int getUuid() { return uuid; }

    public void setUuid(int uuid) { this.uuid = uuid; }
    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
