package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcTemplate_Impl {

    public int update(String sql, Object... args)throws Exception{
        int rc = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try{
            conn = ConnectDB.getInstacne().connect();
            stmt = conn.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                if(args[i] == null){
                    stmt.setObject(i+1, null);
                }
                else if(args[i] instanceof Integer){
                    stmt.setInt(i+1, ((Integer)args[i]).intValue());
                }
                else if(args[i] instanceof Double){
                    stmt.setDouble(i+1, ((Double)args[i]).doubleValue());
                }
                else if(args[i] instanceof String){
                    stmt.setString(i+1, ((String)args[i]));
                }
                rc = stmt.executeUpdate();
            }

        }catch(Exception e){

        }finally {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }

        return rc;
    }
//    public <T extends Object> T qeuryForObject(String sql, RowMapper<T> rowMapper, Object... args) throws Exception{
//        T vo = null;
//
//        return vo;
//
//    }



    public <T extends Object>  T mapRow(){


        return null;
    }

}
