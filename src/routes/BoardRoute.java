package routes;

public class BoardRoute {
    private final String baseURL;
    private final String prefix = "/bbs";

    public final String board_list;
    public final String post_add;
    public final String post_view;
    public final String post_write;
    public final String post_get;
    public final String post_change;
    public final String post_update;
    public final String post_delete;
    public final String board_search;
    public final String shop;
    public final String login;

    public BoardRoute( String ctxPath ) {
        baseURL = ctxPath + "/html" + prefix;

        board_list = baseURL + "/board_list.jsp";
        post_add = baseURL + "/post_add.jsp";
        post_view = baseURL + "/post_view.jsp";
        post_write = baseURL + "/post_write.jsp";
        post_get = baseURL + "/post_get.jsp";
        post_change = baseURL + "/post_change.jsp";
        post_update = baseURL + "/post_update.jsp";
        post_delete = baseURL + "/post_delete.jsp";
        board_search = baseURL + "/board_search.jsp";
        shop = baseURL + "/shop.jsp";
        login = baseURL + "/login.jsp";
    }
}
