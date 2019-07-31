package DAO;

import VO.UserVO;

import java.util.List;

public interface UserDAO{
  void add(UserVO vo) throws Exception;
  List<UserVO> findAll() throws Exception;
}
