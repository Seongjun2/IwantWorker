package VO;

public class PayLogVO{
   private Integer pay_id = null;
   private Integer uuid = null;
   private String tell = null;
   private Integer point = null;
   private Integer price = null;
   private String status = null;
   private String requestTime = null;
   private String updateTime = null;

   public Integer getPay_id() {
      return pay_id;
   }

   public void setPay_id(Integer pay_id) {
      this.pay_id = pay_id;
   }

   public Integer getUuid() {
      return uuid;
   }

   public void setUuid(Integer uuid) {
      this.uuid = uuid;
   }

   public String getTell() {
      return tell;
   }

   public void setTell(String tell) {
      this.tell = tell;
   }

   public Integer getPoint() {
      return point;
   }

   public void setPoint(Integer point) {
      this.point = point;
   }

   public Integer getPrice() {
      return price;
   }

   public void setPrice(Integer price) {
      this.price = price;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String getRequestTime() {
      return requestTime;
   }

   public void setRequestTime(String requestTime) {
      this.requestTime = requestTime;
   }

   public String getUpdateTime() {
      return updateTime;
   }

   public void setUpdateTime(String updateTime) {
      this.updateTime = updateTime;
   }

   @Override
   public String toString() {
      return "PayLogVO{" +
              "pay_id=" + pay_id +
              ", uuid=" + uuid +
              ", tell='" + tell + '\'' +
              ", point=" + point +
              ", price=" + price +
              ", status='" + status + '\'' +
              ", requestTime='" + requestTime + '\'' +
              ", updateTime='" + updateTime + '\'' +
              '}';
   }
}
