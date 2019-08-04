package DAO;

import VO.UserVO;
import database.ConnectDB;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO_Impl implements UserDAO, RowMapper<UserVO> {
    private ConnectDB sqlConnector = ConnectDB.getInstacne();
    private JdbcTemplate template = null;
    private Connection conn;

    @Override
    public void add(UserVO vo) throws Exception {

    }

    @Override
    public List<UserVO> findAll() throws Exception {
        List<UserVO> list = new ArrayList<>();
        template = new JdbcTemplate();
        RowMapper<UserVO> rowMapper = new UserDAO_Impl();

        conn = sqlConnector.connect();
        String sql = "select * from user";
        list = template.query(sql, rowMapper);

        conn.close();

        return list;
    }

    @Override
    public UserVO getUserInfo(int uuid) throws Exception {

        UserVO vo = null;
        template = new JdbcTemplate();
        RowMapper<UserVO> rowMapper = new UserDAO_Impl();

        conn = sqlConnector.connect();
        String sql = "select * from user where uuid = ?";
        vo = template.qeuryForObject(sql, rowMapper, uuid);;

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
