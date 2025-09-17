package io.loopcamp.jdbctests.day01;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class p03_MetaData {
    public static void main(String[] args) throws SQLException {

        // Connection Strings
        String dbURL = "jdbc:oracle:thin:@54.162.174.255:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";

        // 3 initial Interfaces to work with DB
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword); // creates connection
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); // to be able to execute queries
        ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");


        // ----------------------------------------------------------

        /*
            DatabaseMetaData
                - will give up information about the database itself.
                - we will usee "conn" reference to get this information.
         */
        System.out.println("DATA BASE META DATA");
        DatabaseMetaData dbmd = conn.getMetaData();
        System.out.println( "DB Username: " + dbmd.getUserName());
        System.out.println( "DB product name: " + dbmd.getDatabaseProductName());
        System.out.println( "DB product version: " + dbmd.getDatabaseProductVersion());
        System.out.println( "DB driver name: " + dbmd.getDriverName());
        System.out.println( "DB driver version: " + dbmd.getDriverVersion());
        System.out.println( "DB URL: " + dbmd.getURL());



        System.out.println("----------------------------------------------------------");

        /*
            ResultSetMetaData
                - will help up to work with columns / upper section of the table/result
                - we will usee "rs" reference to get this information.
         */

        System.out.println("RESULT SET META DATA");
        ResultSetMetaData rsMetaData = rs.getMetaData();

        // To get how many columns there are in the result set
        System.out.println( "Number of columns: " + rsMetaData.getColumnCount() );


        // To get column name
        // System.out.println( "Column name: " + rsMetaData.getColumnName(0) ); // this method does not support 0 as first index
        System.out.println( "1st Column name: " + rsMetaData.getColumnName(1) );
        System.out.println( "11th Column name: " + rsMetaData.getColumnName(11) );


        System.out.println( "11th Column name: " + rsMetaData.getColumnName( rsMetaData.getColumnCount() ) );


        System.out.println();
        // How can I get all the column names from the result set?
        for (int i = 1; i <= rsMetaData.getColumnCount(); i++) {
            System.out.println( "Column name: " + rsMetaData.getColumnName(i));
        }


        System.out.println("----------------------------------------------------------");

        rs.beforeFirst();


        Map <String, String> row1 = new LinkedHashMap<>();
        row1.put("EMPLOYEE_ID", "100");
        row1.put("FIRST_NAME", "Steven");
        row1.put("LAST_NAME", "King");
        System.out.println(row1);

        // rs.next();

        Map <String, String> row2 = new LinkedHashMap<>();
        row2.put("EMPLOYEE_ID", "101");
        row2.put("FIRST_NAME", "Neena");
        row2.put("LAST_NAME", "Yang");
        System.out.println(row2);

        System.out.println("----------------------------------------------------------");
        rs.beforeFirst();
        List <Map <String, String>> allEmployees = new ArrayList<>();

        // while loop helps to loop throgh ROWS
        while (rs.next()) {
            Map <String, String> row = new LinkedHashMap<>();


            // for loop helps to loop throgh COLUMNS for each ROW
            for (int i = 1; i <= rsMetaData.getColumnCount(); i++) {

                String eachColumnName = rsMetaData.getColumnName(i); // EMPLOYEE_ID
                String eachRowAndEachColumnValue = rs.getString(eachColumnName); // 100

                row.put(eachColumnName, eachRowAndEachColumnValue ); // rs.getString(EMPLOYEE_ID)

            }

            // After completed each row with columns, I add that Map into List
            //System.out.println(row);
            allEmployees.add(row);

        }

        // get me the first person info
        System.out.println("1st emp: " + allEmployees.getFirst());
        System.out.println("1st emp: " + allEmployees.get(0));


        // get me the 2nd person Last_name
        System.out.println(allEmployees.get(1));
        System.out.println(allEmployees.get(1).get("LAST_NAME"));

        System.out.println("-------------------------------");
        // get me all last name
        for (Map <String, String> eachEmployee : allEmployees) {
            if ( eachEmployee.get("LAST_NAME").contains("K")){
                System.out.println("Each last name: " + eachEmployee.get("LAST_NAME") + "");
            }
        }


    }
}
