package Util;

import database.ConnectDB;
import routes.AdminRoute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.Statement;

public class PointUpdateTransaction {

    public static void updatePoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AdminRoute adminRoute = new AdminRoute(request.getContextPath());
        Connection conn = ConnectDB.getInstacne().connect();
        String status = request.getParameter("status");
        String uuid = request.getParameter("uuid");
        int chargePoint = Integer.parseInt(request.getParameter("chargePoint").toString());
        int pay_id = Integer.parseInt(request.getParameter("pay_id").toString());

        System.out.println("status : " + status + " uuid : "+ uuid + " chargePoint : " +chargePoint + " pay id : "+pay_id );

        conn.setAutoCommit(false);
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            if(status.equals("Success")){
                String sql = "update user set point=point+"+chargePoint+" where uuid ="+uuid;
                stmt.executeUpdate(sql);
                sql = "update paylog set Status='"+status+"', UpdateTime=now() where pay_id="+pay_id;
                stmt.executeUpdate(sql);
            }
            else if(status.equals("Expire")){
                String sql = "update paylog set Status='"+status+"', UpdateTime=now() where pay_id="+pay_id;
                stmt.executeUpdate(sql);
            }
            conn.commit();
            System.out.println("포인트 업데이트 성공");
            response.sendRedirect(adminRoute.wating_pay);
        } catch (Exception e){
//            e.printStackTrace();
            conn.rollback();
            System.out.println("포인트 업데이트 실패");
            response.sendRedirect(adminRoute.wating_pay);
        }finally {
            stmt.close();
            conn.close();
        }
    }
}
