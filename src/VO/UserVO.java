package VO;

public class UserVO{


    private Integer uuid;
    private String tell;
    private String name;
    private String pw;
    private Integer permission;// 1: 비로그인, 2: 로그인(회원), 3:로그인(프리미엄) ,10: 관리자
    private Integer point;
    private String question;
    private String answer;

    public Integer getUuid() { return uuid; }

    public void setUuid(Integer uuid) { this.uuid = uuid; }
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

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public String getAnswer() { return answer; }

    public void setAnswer(String answer) { this.answer = answer; }

    public String getQuestion() { return question; }

    public void setQuestion(String question) { this.question = question;}

    @Override
    public String toString() {
        return "UserVO{" +
                "uuid=" + uuid +
                ", tell='" + tell + '\'' +
                ", name='" + name + '\'' +
                ", pw='" + pw + '\'' +
                ", permission=" + permission +
                ", point=" + point +
                '}';
    }
}
