package io.loopcamp.jdbctests.day02;


import io.loopcamp.util.ConfigurationReader;
import io.loopcamp.util.DB_Utility;
import org.junit.Test;

import java.sql.*;
import java.util.List;
import java.util.Map;

public class p01_DBUtilPractice {

    @Test
    public void task1 () throws SQLException {
        // Connection Strings
        //String dbURL = "jdbc:oracle:thin:@107.22.137.10:1521:XE";
        String dbURL = ConfigurationReader.getProperty("hrDbUrl");
        //String dbUsername = "hr";
        String dbUsername = ConfigurationReader.getProperty("hrDbUsername");
        //String dbPassword = "hr";
        String dbPassword = ConfigurationReader.getProperty("hrDbPassword");

        // 3 initial Interfaces to work with DB
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword); // creates connection
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); // to be able to execute queries
        ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");

        rs.next();  // In 1st row
        System.out.println(rs.getString("FIRST_NAME"));
    }

    @Test
    public void task2 () throws SQLException {

        // Connection Strings
        String dbURL = ConfigurationReader.getProperty("hrDbUrl");
        String dbUsername = ConfigurationReader.getProperty("hrDbUsername");
        String dbPassword = ConfigurationReader.getProperty("hrDbPassword");


        DB_Utility.createConnection(dbURL, dbUsername, dbPassword);
        ResultSet rs = DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES");


        rs.next();  // In 1st row
        rs.absolute(10); //
        System.out.println(rs.getString("FIRST_NAME"));
        System.out.println(rs.getString("EMAIL"));

    }

    @Test
    public void task3 () {

        DB_Utility DB_Utility = null;
        io.loopcamp.util.DB_Utility.createConnection();
        DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%' ");

        System.out.println("Row count: " + DB_Utility.getRowCount());
        System.out.println("Column count: " + DB_Utility.getColumnCount());
        System.out.println("All column names from query: " + DB_Utility.getAllColumnNamesAsList());
        System.out.println("All data for row 5: " + DB_Utility.getRowDataAsList(5));
        System.out.println("Data in a specific cell: " + DB_Utility.getCellValue(7, 3));
        System.out.println("1st Row and 1st Column: " + DB_Utility.getFirstRowFirstColumn());
        System.out.println("1st Row and 1st Column: " + DB_Utility.getCellValue(1, 1));
        System.out.println("Column data as list for specific column: " + DB_Utility.getColumnDataAsList(1));
        System.out.println("Column data as list for specific column: " + DB_Utility.getColumnDataAsList("FIRST_NAME"));
        System.out.println("---------------------------------------");
        DB_Utility.displayAllData();
        System.out.println("---------------------------------------");
        System.out.println("Data as Map for specific row: " + DB_Utility.getRowMap(3));
        System.out.println("---------------------------------------");
        System.out.println("All data from the query result as List of Map: " + DB_Utility.getAllRowAsListOfMap());

        System.out.println("---------------------------------------");
        List <Map<String, String>> allEmployees = DB_Utility.getAllRowAsListOfMap();

        for (Map <String, String> eachMap : allEmployees) {
            System.out.println(eachMap.get("LAST_NAME"));
        }

        DB_Utility.destroy();

        System.out.println("---------------------------------------");
        DB_Utility.createConnection();
        DB_Utility.runQuery("SELECT EMAIL FROM EMPLOYEES");
        System.out.println("Data as Map for specific row: " + DB_Utility.getRowMap(3));

        DB_Utility.destroy();

    }

}