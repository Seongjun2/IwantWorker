package VO;

public class BannerVO {
    private Integer banner_id = null;
    private String image = null;
    private String uploadTime = null;

    public Integer getBanner_id() {
        return banner_id;
    }

    public void setBanner_id(Integer banner_id) {
        this.banner_id = banner_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }
}
