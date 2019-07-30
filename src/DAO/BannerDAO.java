package DAO;

import VO.BannerVO;
import VO.BoardVO;

import java.util.List;

public interface BannerDAO {
    public void add(BannerVO vo) throws Exception;
    public List<BannerVO> findAll() throws Exception;
}
