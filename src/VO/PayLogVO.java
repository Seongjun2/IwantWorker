package VO;

public class PayLogVO{
    private int point_id;
    private String uuid;
    private String info;
    private int point;
    private int pointTotal;
    private String logData;

    public int getPoint_id() {
        return point_id;
    }

    public void setPoint_id(int point_id) {
        this.point_id = point_id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getPointTotal() {
        return pointTotal;
    }

    public void setPointTotal(int pointTotal) {
        this.pointTotal = pointTotal;
    }

    public String getLogData() {
        return logData;
    }

    public void setLogData(String logData) {
        this.logData = logData;
    }
}
