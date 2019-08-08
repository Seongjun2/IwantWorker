package DAO;

import VO.BoardVO;

import java.util.List;

public interface BoardDAO{
  void add(Object... args) throws Exception;
  void update(Object... args) throws Exception;
  List<BoardVO> findAll() throws Exception;
  List<BoardVO> findByUUID(Integer Uuid) throws Exception;
  BoardVO findByBoID(Integer Boid) throws Exception;
  void deleteByBoID(Integer Boid) throws Exception;
  public int getCount() throws Exception;
}
