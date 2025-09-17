package io.loopcamp.jdbctests.day01;

import java.sql.*;

public class p02_FlexibleNavigation {
    public static void main(String[] args) throws SQLException {
//jdbc:oracle:thin:@54.162.174.255:1521:XE

        // Connection Strings
        String dbURL = "jdbc:oracle:thin:@54.162.174.255:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword); // creates connection

        // To be able to navigate through raws, we need 2 arguments
        // 1- ResultSet.TYPE_SCROLL_INSENSITIVE: - helps us to navigate through raws
        // 2- ResultSet.CONCUR_READ_ONLY: - we will not be able to update the data in the database
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); // to be able to execute queries

        ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES"); // to be able to store the data comes back

        rs.next();
        String nameAndPhone = rs.getString("FIRST_NAME") + " " + rs.getString("PHONE_NUMBER");
        System.out.println(nameAndPhone);


        System.out.println();
        while (rs.next()) {
            System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );
        }

        // This will give an error because we are at the after last row and there is not data.
        //System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );

        System.out.println("----------------------------------------------");
        // To be able to navigate through raws, we need 2 arguments
        rs.first(); // jumps back to the 1st row
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER") );


        // Jump to the specific row
        rs.absolute(10); // jumps to the 10th row
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER") );

        // Jump to the last row
        rs.last();
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER") );


        System.out.println("++++++++++++++++++++++++++++++++++++");
        rs.first();
        while (rs.next()) {
            System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );
        }

        System.out.println("----------------------------------------------");
        rs.beforeFirst();
        while (rs.next()) {
            System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );
        }

        //System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );

        System.out.println();
        rs.absolute(100);
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );

        rs.previous();
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );


        rs.close();
        stmt.close();
        conn.close();

        rs.first();
        System.out.println( rs.getString("FIRST_NAME") + ": \t\t" + rs.getString("PHONE_NUMBER")  );


    }
}