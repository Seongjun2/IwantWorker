package pagination;

import DAO.*;
import VO.BoardVO;
import VO.UserVO;

import java.util.List;

public class Paging{
    private final static int pageCount = 10;
    private final static int rangeCount = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int curPageNum = 0;
    private int total = 0;

    public Paging(int curPage, int total) {
        this.total = total;
        this.curPageNum = curPage;

        makeBlock(this.curPageNum);
        this.lastPageNum = makeLastPageNum(total);
    }

    @Deprecated
    public Paging() {
    }

    public int getStartIdx() {
        return ((this.curPageNum - 1) * pageCount)+1;
    }

    public int getLastIdx() {
        int startIdx = getStartIdx();

        return Math.min(startIdx+(pageCount-1), total);
    }

    public void makeBlock(int curPage){
        int blockNum = 0;

        blockNum = (int) ((curPage-1)/pageCount);
        blockStartNum = (pageCount * blockNum )+1;
        blockLastNum = blockStartNum + (pageCount-1);
    }

    private int makeLastPageNum(int total) {

        if(total % pageCount == 0){
            return (int) (total/pageCount);
        }
        else{
            return (int) (total/pageCount) + 1;
        }
    }

    //userDAO 기준 테스트
    @Deprecated
    public void makeLastPageNum_userList() throws Exception{
        UserDAO dao = new UserDAO_Impl();
        int total = dao.getCount();

        if(total % pageCount == 0){
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else{
            lastPageNum = (int)Math.floor(total/pageCount)+1;
        }
    }
    @Deprecated
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
    @Deprecated
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

}
