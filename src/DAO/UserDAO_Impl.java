package DAO;

import VO.UserVO;
import database.JdbcTemplate;
import database.RowMapper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO_Impl implements UserDAO, RowMapper<UserVO> {
    private JdbcTemplate template = null;

    @Override
    public void add(Object... args) throws Exception {
        template = new JdbcTemplate();
        String sql = "insert into user values ( default , ?, ? , ? , 2 , 0 )";
        template.update( sql , args );
    }

    @Override
    public List<UserVO> findAll() throws Exception {
        List<UserVO> list = new ArrayList<>();
        template = new JdbcTemplate();
        RowMapper<UserVO> rowMapper = new UserDAO_Impl();

        String sql = "select * from user";
        list = template.query(sql, rowMapper);

        return list;
    }

    @Override
    public UserVO getUserInfo(int uuid) throws Exception {

        UserVO vo = null;
        template = new JdbcTemplate();
        RowMapper<UserVO> rowMapper = new UserDAO_Impl();

        String sql = "select * from user where uuid = ?";
        vo = template.qeuryForObject(sql, rowMapper, uuid);;

        return vo;
    }

    @Override
    public UserVO getUserInfo(String tell) throws Exception {
        template = new JdbcTemplate();
        RowMapper<UserVO> rowMapper = new UserDAO_Impl();
        String sql = "select * from user where tell = ?";

        UserVO vo = template.qeuryForObject(sql, rowMapper, tell);
        return vo;
    }

    @Override
    public void update(Object... args) throws Exception {
        template = new JdbcTemplate();

        String sql = "update user set tell = ?, pw = ? where uuid = ?";
        int result = template.update(sql, args);

        if(result < 1){
            System.out.println("변경된 것이 없습니다.");
        }
    }

    @Override
    public void pointUpdate(Object... args) throws Exception {
        template = new JdbcTemplate();
        String sql = "update user set point=point+? where uuid = ?";
        int result = template.update(sql, args);

        if(result < 1){
            System.out.println("변경된 것이 없습니다.");
        }
    }
    @Override
    public int getCount() throws Exception{
       template = new JdbcTemplate();
       String sql = "SELECT COUNT(*) as cnt FROM user";
       int rc = template.rowCount(sql);

       if(rc == -1){
           System.out.println("Error : fail get rowCount");
       }

       return rc;
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
