package DAO;

import VO.UserVO;

import java.sql.ResultSet;
import java.util.List;

public interface UserDAO{
  void add(Object... args) throws Exception;
  List<UserVO> findAll() throws Exception;
  UserVO getUserInfo(int uuid) throws Exception;
  UserVO getUserInfo(String tell) throws Exception;
  void update(Object... args) throws Exception;
  void pointUpdate(Object... args) throws Exception;
}
