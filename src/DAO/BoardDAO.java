package DAO;

import VO.BoardVO;

import java.util.List;

public interface BoardDAO{
  void add(BoardVO vo) throws Exception;
  List<BoardVO> findAll() throws Exception;
  List<BoardVO> findByUUID(Integer Uuid) throws Exception;
}
