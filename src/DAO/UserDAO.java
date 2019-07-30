package DAO;

import VO.UserVO;

import java.util.List;

public interface UserDAO{
  public void add(UserVO vo) throws Exception;
  public List<UserVO> findAll() throws Exception;
}
