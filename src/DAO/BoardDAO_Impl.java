package DAO;

import VO.BoardVO;
import com.mysql.cj.result.Row;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO_Impl implements BoardDAO, RowMapper<BoardVO> {
    private JdbcTemplate jdbcTemplate = null;
    List<BoardVO> boardList = null;

    @Override
    public void add(Object... args) throws Exception {
        jdbcTemplate = new JdbcTemplate();

        String sql = "insert into board values (default, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, args);
    }

    @Override
    public List<BoardVO> findAll() throws Exception {
        boardList = new ArrayList<BoardVO>();
        jdbcTemplate = new JdbcTemplate();
        RowMapper<BoardVO> rowMapper = new BoardDAO_Impl();

        String sql = "select * from Board";
        boardList = jdbcTemplate.query(sql, rowMapper);

        return boardList;
    }

    @Override
    public BoardVO mapRow(ResultSet rs) throws Exception {
        BoardVO vo = new BoardVO();

        vo.setUuid(rs.getString("uuid"));
        vo.setText(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setEndDate(rs.getString("endDate"));
        vo.setWorkTime(rs.getString("workTime"));
        vo.setMoney(rs.getInt("money"));
        vo.setAddress(rs.getString("Addr"));
        vo.setWriteTime(rs.getString("writeTime"));

        return vo;
    }
}
