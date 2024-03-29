package routes;

public class Router {
    private static Router router = null;

    public final MainRoute main;
    public final MypageRoute mypage;
    public final AdminRoute admin;
    public final BoardRoute board;
    public final ErrorRoute error;

    private Router(String ctxPath) {
        main = new MainRoute( ctxPath );
        mypage = new MypageRoute( ctxPath );
        admin = new AdminRoute( ctxPath );
        board = new BoardRoute( ctxPath );
        error = new ErrorRoute( ctxPath );
    }

    public static Router getInstance(String ctxPath) {
        if (router == null) router = new Router( ctxPath );
        return router;
    }
}
