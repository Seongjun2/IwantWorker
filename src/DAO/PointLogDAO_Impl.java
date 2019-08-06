package DAO;

import VO.PointLogVO;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.ResultSet;
import java.util.List;

public class PointLogDAO_Impl implements PointLogDAO, RowMapper<PointLogVO> {
    private JdbcTemplate template = null;

    public PointLogDAO_Impl() {
        this.template = new JdbcTemplate();
    }

    @Override
    public void add(PointLogVO vo) throws Exception {

    }

    @Override
    public List<PointLogVO> findAll() throws Exception {
        return null;
    }

    @Override
    public List<PointLogVO> findByUUID(Integer uuid) throws Exception {
        List<PointLogVO> pointLogs = null;
        return pointLogs;
    }

    @Override
    public PointLogVO mapRow(ResultSet rs) throws Exception {
        PointLogVO vo = new PointLogVO();

        vo.setUuid( rs.getInt("uuid") );
        vo.setInfo( rs.getString("info") );
        vo.setPoint( rs.getInt("point") );
        vo.setPointTotal( rs.getInt("pointtotal") );
        vo.setLogDate( rs.getString("logdate") );

        return vo;
    }
}
