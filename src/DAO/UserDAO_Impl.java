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
            UserVO vo = mapRow(rs);
            System.out.println(vo);
            list.add(vo);
        }
        rs.close();
        stmt.close();
        conn.close();

        return list;
    }

    @Override
    public UserVO getUserInfo(int uuid) throws Exception {

        conn = sqlConnector.connect();
        Statement stmt = conn.createStatement();
        System.out.println("this s");
        String sql = "select * from user where uuid = " + uuid;
        System.out.println(sql);
        ResultSet rs = stmt.executeQuery(sql);
        UserVO vo = null;

        if(rs.next()) vo = mapRow(rs);

        rs.close();
        stmt.close();
        conn.close();
        return vo;
    }

    @Override
    public UserVO mapRow(ResultSet rs) throws Exception{
        UserVO vo = new UserVO();

        vo.setUuid(rs.getInt("uuid"));
        vo.setTell(rs.getString("tell"));
        vo.setName(rs.getString("name"));
        vo.setPw(rs.getString("pw"));
        vo.setPermission(rs.getInt("permission"));
        vo.setPoint(rs.getInt("point"));

        return vo;
    }
}
