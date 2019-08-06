package routes;

public class AdminRoute {
    final String prefix = "/adm";
    final String baseURL;

    public final String modify_userInfo;
    public final String userinfo_update;
    public final String userlist;
    public final String wating_pay;
    public final String banner;

    public AdminRoute (String ctxPath) {
        baseURL = ctxPath + "/html" + prefix;

        modify_userInfo = baseURL + "/modify_userInfo_admin.jsp";
        userinfo_update = baseURL + "/userInfoUpdate.jsp";
        userlist = baseURL + "/userList_Admin.jsp";
        wating_pay = baseURL + "/waitingPay_admin.jsp";
        banner = baseURL + "/banner.jsp";
    }
}
