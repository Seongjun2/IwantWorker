package DAO;

import VO.BannerVO;
import database.RowMapper;

import java.sql.ResultSet;
import java.util.List;

public class BannerDAO_Impl implements BannerDAO, RowMapper<BannerVO> {
    @Override
    public void add(BannerVO vo) throws Exception {

    }

    @Override
    public List<BannerVO> findAll() throws Exception {
        return null;
    }

    @Override
    public BannerVO mapRow(ResultSet rs) throws Exception {//고쳐야댐
        BannerVO vo = new BannerVO();
        vo.setBanner_id(rs.getInt(""));
        return vo;
    }
}
