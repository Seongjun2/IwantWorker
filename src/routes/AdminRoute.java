package routes;

public class AdminRoute {
    final String prefix = "/admin";
    final String baseURL;

    public final String modify_userInfo;
    public final String userinfo_update;
    public final String userlist;
    public final String wating_pay;

    public AdminRoute (String ctxPath) {
        baseURL = ctxPath + "/html" + prefix;

        modify_userInfo = "/modify_userInfo_admin.jsp";
        userinfo_update = "/userInfoUpdate.jsp";
        userlist = "/userList_Admin.jsp";
        wating_pay = "/waitingPay_admin.jsp";
    }
}
