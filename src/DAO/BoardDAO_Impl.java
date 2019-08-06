package DAO;

import VO.BoardVO;
import database.JdbcTemplate;
import database.RowMapper;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO_Impl implements BoardDAO, RowMapper<BoardVO> {
    private JdbcTemplate template = null;
    List<BoardVO> boardList = null;

    public BoardDAO_Impl() {
        this.template = new JdbcTemplate();
    }

    @Override
    public void add(Object... args) throws Exception {

        String sql = "insert into board values (default, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        template.update(sql, args);
    }

    @Override
    public List<BoardVO> findAll() throws Exception {
        boardList = new ArrayList<BoardVO>();
        template = new JdbcTemplate();
        RowMapper<BoardVO> rowMapper = new BoardDAO_Impl();

        String sql = "select * from Board";
        boardList = template.query(sql, rowMapper);

        return boardList;
    }

    @Override
    public List<BoardVO> findByUUID(Integer uuid) throws Exception {
        String sql = "SELECT " +
                "Bo_Id, Uuid, Title, Content, StartDate, EndDate, WorkTime, Money, Addr, WriteTime " +
                "FROM board " +
                "WHERE Uuid = ?";

        List<BoardVO> boards = null;
        RowMapper<BoardVO> rowMapper = new BoardDAO_Impl();

        boards = template.query(sql, rowMapper, uuid);

        return boards;
    }

    @Override
    public BoardVO findByBoID(Integer boid) throws  Exception{
        String sql = "SELECT " +
                "Bo_Id, Uuid, Title, Content, StartDate, EndDate, WorkTime, Money, Addr, WriteTime " +
                "FROM board " +
                "WHERE Bo_Id = ?";

        BoardVO vo = null;

        return vo;
    }

    @Override
    public BoardVO mapRow(ResultSet rs) throws Exception {
        BoardVO vo = new BoardVO();

        vo.setBoard_id(rs.getInt("Bo_Id"));
        vo.setUuid(rs.getInt("uuid"));
        vo.setText(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setStartDate(rs.getString("startDate"));
        vo.setEndDate(rs.getString("EndDate"));
        vo.setWorkTime(rs.getString("WorkTime"));
        vo.setMoney(rs.getInt("money"));
        vo.setAddress(rs.getString("addr"));
        vo.setWriteTime(rs.getString("writeTime"));

        return vo;
    }
}
