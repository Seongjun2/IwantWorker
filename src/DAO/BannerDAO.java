package DAO;

import VO.BannerVO;
import VO.BoardVO;

import java.util.List;

public interface BannerDAO {
    void add(BannerVO vo) throws Exception;
    List<BannerVO> findAll() throws Exception;
    void removeAll() throws Exception;
}
