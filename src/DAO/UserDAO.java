package DAO;

import VO.UserVO;

import java.sql.ResultSet;
import java.util.List;

public interface UserDAO{
  void add(Object... args) throws Exception;
  List<UserVO> findAll() throws Exception;
  UserVO getUserInfo(int uuid) throws Exception;
  UserVO getUserInfo2(String tell) throws Exception;
  List<UserVO> getSearchInfo(String name) throws Exception;
  void update(Object... args) throws Exception;
  List<UserVO> getUsers() throws Exception;
  int getCount() throws Exception;
  void deleteByUUID(int uuid) throws Exception;

}
