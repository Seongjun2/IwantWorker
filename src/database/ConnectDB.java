package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnectDB {

    public Connection connect() throws Exception {//DB연결, 연결 후 conn 리턴
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/study?serverTimezone=UTC","root","seongjun100");
        return conn;
    }

    public void disConnect(Connection conn) throws Exception{
        conn.close();
    }
}
