package VO;

public class PointLogVO{
    private int uuid;
    private String info;
    private int point;
    private int pointTotal;
    private String LogDate;

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
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

    public String getLogDate() {
        return LogDate;
    }

    public void setLogDate(String logDate) {
        LogDate = logDate;
    }
}
