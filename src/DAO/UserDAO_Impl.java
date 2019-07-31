package DAO;

import VO.UserVO;
import database.ConnectDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO_Impl implements UserDAO {
    private ConnectDB sqlConnector = ConnectDB.getInstacne();

    private Connection conn;
    @Override
    public void add(UserVO vo) throws Exception {

    }

    @Override
    public List<UserVO> findAll() throws Exception {
        List<UserVO> list = new ArrayList<>();
        conn = sqlConnector.connect();
        Statement stmt = conn.createStatement();
        String sql = "select * from user";
        ResultSet rs = stmt.executeQuery(sql);

        while(rs.next()){
            UserVO vo = new UserVO();
            vo.setUuid(rs.getInt("uuid"));
            vo.setTell(rs.getString("tell"));
            vo.setName(rs.getString("name"));
            vo.setPw(rs.getString("pw"));
            vo.setPermission(rs.getInt("permission"));
            vo.setPoint(rs.getInt("point"));

            System.out.println(vo);
            list.add(vo);
        }
        rs.close();
        stmt.close();
        conn.close();

        return list;
    }
}
