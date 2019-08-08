package pagination;

import DAO.*;
import VO.BoardVO;
import VO.UserVO;

import java.util.List;

public class Paging <T extends Object>{
    private final static int pageCount = 10;
    private final static int rangeCount = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;

    public int getBlockStartNum() {
        return blockStartNum;
    }

    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }

    public int getBlockLastNum() {
        return blockLastNum;
    }

    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }

    public int getLastPageNum() {
        return lastPageNum;
    }

    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }


    public void makeBlock(int curPage){
        int blockNum = 0;

        blockNum =(int)Math.floor((curPage-1)/pageCount);
        blockStartNum = (pageCount * blockNum )+1;
        blockLastNum = blockStartNum + (pageCount-1);
    }

    //userDAO 기준 테스트
    public void makeLastPageNum_userList(T vo) throws Exception{
        UserDAO dao = new UserDAO_Impl();
        int total = dao.getCount();

        if(total % pageCount == 0){
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else{
            lastPageNum = (int)Math.floor(total/pageCount)+1;
        }
    }
    public void makeLastPageNum_board() throws Exception{
        BoardDAO boardDAO = new BoardDAO_Impl();
        int total = boardDAO.getCount();
        if(total % pageCount == 0){
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else{
            lastPageNum = (int)Math.floor(total/pageCount)+1;
        }
    }
    public void makeLastPageNum_payList() throws Exception{
        PayLogDAO payLogDAO = new PayLogDAO_Impl();
        payLogDAO.findAll();
        int total = payLogDAO.getCount();

        if(total % pageCount == 0){
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else{
            lastPageNum = (int)Math.floor(total/pageCount)+1;
        }
    }

    /*
    public void makeLastPageNum(String kwd){//검색했을 때에
        UserDAO dao = new UserDAO_Impl();
        int total = dao.getCount(kwd);

        if(total % pageCount == 0){
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else{
            lastPageNum = (int)Math.floor((total/pageCount));
        }
    }
     */
}
