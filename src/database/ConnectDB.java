package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

    public void connect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/study?serverTimezone=UTC","root","seongjun100");
    }
}
