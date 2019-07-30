package DAO;

import VO.BoardVO;

import java.util.List;

public interface BoardDAO{
  public void add(BoardVO vo) throws Exception;
  public List<BoardVO> findAll() throws Exception;
}
