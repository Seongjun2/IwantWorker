package routes;

public class MainRoute {
    final String prefix = "";
    final String baseURL;

    public final String index = "index.jsp";
    public final String login = "login.html";

    public MainRoute (String ctxPath) {
        baseURL = ctxPath + "/html" + prefix;
    }
}
