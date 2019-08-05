package VO;

// TODO: 날짜들의 type이 String 이어도 되는지 고민 필요
public class BoardVO{
    private Integer board_id;
    private Integer uuid;
    private String text; // TODO: DB 스키마와 일치 필요
    private String content;
    private String startDate;
    private String endDate;
    private String workTime;
    private Integer money;
    private String address;
    private String writeTime;

    public Integer getBoard_id() {
        return board_id;
    }

    public void setBoard_id(Integer board_id) {
        this.board_id = board_id;
    }

    public Integer getUuid() {
        return uuid;
    }

    public void setUuid(Integer uuid) {
        this.uuid = uuid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWriteTime() {
        return writeTime;
    }

    public void setWriteTime(String writeTime) {
        this.writeTime = writeTime;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "board_id=" + board_id +
                ", uuid=" + uuid +
                ", text='" + text + '\'' +
                ", content='" + content + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", workTime='" + workTime + '\'' +
                ", money=" + money +
                ", address='" + address + '\'' +
                ", writeTime='" + writeTime + '\'' +
                '}';
    }
}
