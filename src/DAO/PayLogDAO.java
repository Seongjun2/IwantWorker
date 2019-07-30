package DAO;

import VO.PayLogVO;

import java.util.List;

public interface PayLogDAO{
  public void add(PayLogVO vo) throws Exception;
  public List<PayLogVO> findAll() throws Exception;
}
