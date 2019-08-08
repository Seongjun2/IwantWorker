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

    public PayLogDAO_Impl() {
        this.template = new JdbcTemplate();
    }

    @Override
    public void add(PayLogVO vo) throws Exception {

    }

    @Override
    public List<PayLogVO> findAll() throws Exception {
        List<PayLogVO> list = new ArrayList<>();
        RowMapper<PayLogVO> rowMapper = new PayLogDAO_Impl();

        conn = sqlConnector.connect();
        String sql = "select * from paylog";
        list = template.query(sql, rowMapper);

        conn.close();

        return list;
    }

    @Override
    public List<PayLogVO> findByUUID(Integer uuid) throws Exception {
        List<PayLogVO> list = new ArrayList<PayLogVO>();
        String sql = "SELECT " +
                "pay_id, uuid, tell, point, price, status, requestTime, updateTime, name " +
                "FROM paylog " +
                "WHERE uuid=?";

        list = template.query(sql, this, uuid);

        return list;
    }

    @Override
    public int getCount() throws Exception{
        String sql = "SELECT COUNT(*) as cnt FROM paylog";
        int rc = template.rowCount(sql);

        if(rc == -1){
            System.out.println("Error : fail get rowCount");
        }

        return rc;
    }

    @Override
    public List<PayLogVO> findByUUIDAndStatus(Integer uuid, String state) throws Exception {
        List<PayLogVO> list = new ArrayList<PayLogVO>();
        String sql = "SELECT " +
                "pay_id, uuid, tell, point, price, status, requestTime, updateTime, name " +
                "FROM paylog " +
                "WHERE uuid=? and status=?";

        list = template.query(sql, this, uuid, state);

        return list;
    }

    @Override
    public List<PayLogVO> findStatus(String status) throws Exception {
        List<PayLogVO> list = new ArrayList<PayLogVO>();
        String sql = "SELECT * from paylog where status = ?";

        list = template.query(sql, this, status);
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
        vo.setName(rs.getString("name"));

        return vo;
    }
}
