package DAO;

import VO.PointLogVO;

import java.util.List;

public interface PointLogDAO{
  void add(PointLogVO vo) throws Exception;
  List<PointLogVO> findAll() throws Exception;
}
