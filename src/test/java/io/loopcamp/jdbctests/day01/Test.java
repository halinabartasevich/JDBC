package io.loopcamp.jdbctests.day01;

import java.sql.*;

public class Test {
    public static void main(String[] args) throws SQLException {

        String dbURL = "jdbc:oracle:thin:@54.162.174.255:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
        ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");
        rs.next();

        System.out.println(rs.getString("EMPLOYEE_ID"));

        rs.first();


    }
}
