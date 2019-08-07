package DAO;

import VO.PayLogVO;
import database.ConnectDB;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PayLogDAO_Impl implements PayLogDAO, RowMapper<PayLogVO> {
    private ConnectDB sqlConnector = ConnectDB.getInstacne();
    private JdbcTemplate template = null;
    private Connection conn;

    @Override
    public void add(PayLogVO vo) throws Exception {

    }

    @Override
    public List<PayLogVO> findAll() throws Exception {
        List<PayLogVO> list = new ArrayList<>();
        template = new JdbcTemplate();
        RowMapper<PayLogVO> rowMapper = new PayLogDAO_Impl();

        conn = sqlConnector.connect();
        String sql = "select * from paylog";
        list = template.query(sql, rowMapper);

        conn.close();

        return list;
    }

    @Override
    public List<PayLogVO> findByUUID(Integer uuid) throws Exception {
        template = new JdbcTemplate();
        List<PayLogVO> list = new ArrayList<PayLogVO>();
        String sql = "SELECT " +
                "pay_id, uuid, tell, point, price, status, requestTime, updateTime " +
                "FROM paylog " +
                "WHERE uuid=?";

        list = template.query(sql, this, uuid);

        return list;
    }

    @Override
    public PayLogVO mapRow(ResultSet rs) throws Exception {

        PayLogVO vo = new PayLogVO();

        vo.setPay_id(rs.getInt("pay_id"));
        vo.setUuid(rs.getInt("uuid"));
        vo.setTell(rs.getString("tell"));
        vo.setPoint(rs.getInt("point"));
        vo.setPrice(rs.getInt("price"));
        vo.setStatus(rs.getString("status"));
        vo.setRequestTime(rs.getString("requestTime"));
        vo.setUpdateTime(rs.getString("updateTime"));

        return vo;
    }
}
