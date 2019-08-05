package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    private static ConnectDB conn;

    private ConnectDB(){}//인스턴스 생성을 막음.

    public Connection connect() throws Exception {//DB연결, 연결 후 conn 리턴
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://15.164.79.177:3306/leaguelugas?serverTimezone=UTC","leaguelugas","8426753190");

        return conn;
    }

    public static ConnectDB getInstacne() {
        if (conn == null) {
            conn = new ConnectDB();    // 2.메모리에 할당되지 않았을 때 할당하는 방법
        }
        return conn;
    }
}
