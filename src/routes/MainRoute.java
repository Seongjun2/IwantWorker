package routes;

public class MainRoute {
    final String prefix = "";
    final String baseURL;

    public final String index;
    public final String login;

    public MainRoute (String ctxPath) {
        baseURL = ctxPath + "/html" + prefix;

        index = baseURL + "index.jsp";
        login = baseURL + "login.html";
    }
}
