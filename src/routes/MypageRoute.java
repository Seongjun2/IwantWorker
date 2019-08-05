package routes;

public class MypageRoute {
    final String prefix = "/mypage";
    final String baseURL;

    public final String modify_myInfo;
    public final String my_posts;
    public final String pay_list;
    public final String point_list;

    public MypageRoute (String ctxPath) {
        baseURL = ctxPath + "/html" + prefix;

        modify_myInfo = baseURL + "/modify_myInfo.jsp";
        my_posts = baseURL + "/my_posts.jsp";
        pay_list = baseURL + "/pay_list.jsp";
        point_list = baseURL + "/point_list.jsp";
    }
}
