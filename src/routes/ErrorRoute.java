package routes;

public class ErrorRoute {
    private final String baseURL;

    public final String error_403;
    public final String error_404;
    public final String error_500;
    public final String error_etc;
    public final String imgs;
    public final String css;

    public ErrorRoute( String ctxPath ) {
        baseURL = ctxPath + "/error";

        error_403 = baseURL + "/error_403.jsp";
        error_404 = baseURL + "/error_404.jsp";
        error_500 = baseURL + "/error_500.jsp";
        error_etc = baseURL + "/error_etc.jsp";
        css = baseURL;
        imgs = baseURL + "/imgs";
    }
}
