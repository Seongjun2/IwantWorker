package pagination;

import DAO.UserDAO;
import DAO.UserDAO_Impl;

public class Paging {
    private final static int pageCount = 10;
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
    public void makeLastPageNum() throws Exception{
        UserDAO dao = new UserDAO_Impl();
        int total = dao.getCount();
        System.out.println("total : " + total);

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
