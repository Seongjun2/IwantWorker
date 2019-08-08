package DAO;

import VO.PayLogVO;

import java.util.List;

public interface PayLogDAO{
  void add(PayLogVO vo) throws Exception;
  List<PayLogVO> findAll() throws Exception;
  List<PayLogVO> findByUUID(Integer uuid) throws Exception;
  int getCount() throws Exception;
  List<PayLogVO> findByUUIDAndStatus(Integer uuid, String state) throws Exception;
  List<PayLogVO> findStatus(String state) throws Exception;
}
