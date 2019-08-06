package DAO;

import VO.PointLogVO;
import database.JdbcTemplate;

import java.util.List;

public class PointLogDAO_Impl implements PointLogDAO {
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
}
