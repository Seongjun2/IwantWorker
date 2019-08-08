package DAO;

import VO.PayLogVO;

import java.util.List;

public interface PayLogDAO{
  void add(PayLogVO vo) throws Exception;
  List<PayLogVO> findAll() throws Exception;
  List<PayLogVO> findByUUID(Integer uuid) throws Exception;
  public int getCount() throws Exception;
}
