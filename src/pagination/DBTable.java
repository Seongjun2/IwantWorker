package pagination;

public interface DBTable <T extends Object>{
    int getCount(T dao) throws Exception;
}
