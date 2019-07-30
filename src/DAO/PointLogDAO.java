package DAO;

import VO.PointLogVO;

import java.util.List;

public interface PointLogDAO{
  public void add(PointLogVO vo) throws Exception;
  public List<PointLogVO> findAll() throws Exception;
}
