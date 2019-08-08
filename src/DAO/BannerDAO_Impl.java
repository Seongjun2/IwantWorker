package DAO;

import VO.BannerVO;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BannerDAO_Impl implements BannerDAO, RowMapper<BannerVO> {
    private JdbcTemplate template = null;

    @Override
    public void add(BannerVO vo) throws Exception {
        template = new JdbcTemplate();

        String sql = "insert into banner (Image) values ( ? )";
        int result = template.update(sql, vo.getImage());

        if(result < 1){
            System.out.println("변경된 것이 없습니다.");
        }
    }

    @Override
    public List<BannerVO> findAll() throws Exception {
        List<BannerVO> list = new ArrayList<>();
        template = new JdbcTemplate();
        RowMapper<BannerVO> rowMapper = new BannerDAO_Impl();

        String sql = "select * from banner";
        list = template.query(sql,rowMapper);

        return list;
    }

    @Override
    public void removeAll() throws Exception {
        template = new JdbcTemplate();
        String sql = "delete from banner where 1=1";
        int result = template.update(sql);
        System.out.println("삭제한 row 수 : " + result);
    }

    @Override
    public BannerVO mapRow(ResultSet rs) throws Exception {
        BannerVO vo = new BannerVO();
        vo.setBanner_id(rs.getInt("Banner_Id"));
        vo.setImage(rs.getString("Image"));
        return vo;
    }
}
