package DAO;

import VO.BoardVO;

import java.util.List;

public interface BoardDAO{
  void add(Object... args) throws Exception;
  List<BoardVO> findAll() throws Exception;
}
