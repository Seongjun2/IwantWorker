package routes;

public class Router {
    private static Router router = null;

    public final MypageRoute mypage;
    public final AdminRoute admin;

    private Router(String ctxPath) {
        mypage = new MypageRoute( ctxPath );
        admin = new AdminRoute( ctxPath );
    }

    public static Router getInstance(String ctxPath) {
        if (router == null) router = new Router( ctxPath );
        return router;
    }
}
