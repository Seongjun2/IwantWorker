package VO;

public class PointLogVO{
    private Integer pointId;
    private Integer uuid;
    private String info;
    private Integer point;
    private Integer pointTotal;
    private String LogDate;

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public Integer getUuid() {
        return uuid;
    }

    public void setUuid(Integer uuid) {
        this.uuid = uuid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getPointTotal() {
        return pointTotal;
    }

    public void setPointTotal(Integer pointTotal) {
        this.pointTotal = pointTotal;
    }

    public String getLogDate() {
        return LogDate;
    }

    public void setLogDate(String logDate) {
        LogDate = logDate;
    }

    @Override
    public String toString() {
        return "PointLogVO{" +
                "pointId=" + pointId +
                ", uuid=" + uuid +
                ", info='" + info + '\'' +
                ", point=" + point +
                ", pointTotal=" + pointTotal +
                ", LogDate='" + LogDate + '\'' +
                '}';
    }
}
