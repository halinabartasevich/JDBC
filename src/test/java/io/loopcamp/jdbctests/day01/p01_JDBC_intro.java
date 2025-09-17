package io.loopcamp.jdbctests.day01;

import java.sql.*;
import java.util.Stack;

public class p01_JDBC_intro {
    public static void main (String [] args) throws SQLException {
        /*
         jdbc:oracle:thin:@54.162.174.255:1521:XE
         */

        /*
            To make MANUAL connection: we need following information
                HOST:           107.22.137.10
                PORT:           1521 (oracle)
                Username:       hr
                Password:       hr

            To make AUTO connection: we need following information
                dbURL (HOST+PORT):  jdbc:oracle:thin:@54.162.174.255:1521:XE
                dbUsername:         hr
                dbPassword:         hr
         */


            String dbURL = "jdbc:oracle:thin:@54.162.174.255:1521:XE";
            String dbUsername = "hr";
            String dbPassword = "hr";

        /*
            NEXT, we need something from sql package: 3 main Interfaces: Connection, Statement, ResultSet
                Connection —> Helps our java project connect to database
                Statement —> Helps to write and execute SQL query
                ResultSet —> A data structure where we can store the data that came from database
         */

            // 1 -DriverManager is a class that helps us to connect to database
            Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);


            // 2 - We need to create Statement to be able to execute SQL query
            Statement stmt = conn.createStatement();
            // stmt.execute("SELECT * FROM EMPLOYEES");


            // 3 - Now, we need ResultSet to store the data that came from database as a result of my query
            ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");


        /*
            EMP_ID  F_N         L_N
            100,    Steven,     King,SKING,1.515.555.0100,2013-06-17,AD_PRES,24000.00,,,90
            101,    Neena,      Yang,NYANG,1.515.555.0101,2015-09-21,AD_VP,17000.00,,100,90
            102,    Lex,        Garcia,LGARCIA,1.515.555.0102,2011-01-13,AD_VP,17000.00,,100,90
            103,    Alexander,  James,AJAMES,1.590.555.0103,2016-01-03,IT_PROG,9000.00,,102,60
            104,    Bruce,      Miller,BMILLER,1.590.555.0104,2017-05-21,IT_PROG,6000.00,,103,60
            ...

         */
            rs.next(); // now I am in the 1st row

        /*
            2 methods mostly used
                - .getString(int columnIndex); / .getString(String columnName);
                - .getInt(int columnIndex); / .getInt(String columnName);
         */

            System.out.println(rs.getString("EMPLOYEE_ID"));
            System.out.println(rs.getString("FIRST_NAME"));
            System.out.println(rs.getString("SALARY"));
            System.out.println(rs.getString("DEPARTMENT_ID"));
            System.out.println(rs.getInt("DEPARTMENT_ID"));
            System.out.println(rs.getString("EMAIL"));
            // System.out.println(rs.getInt("EMAIL")); // SQLException: ORA-17059: Failed to convert to internal representation


            System.out.println();
            rs.next();
            System.out.println(rs.getString("EMPLOYEE_ID"));
            System.out.println(rs.getString("FIRST_NAME"));
            System.out.println(rs.getString("SALARY"));
            System.out.println(rs.getString("DEPARTMENT_ID"));
            System.out.println(rs.getInt("DEPARTMENT_ID"));
            System.out.println(rs.getString("EMAIL"));

            System.out.println();
            System.out.println(rs.getString("FIRST_NAME")); // you cna either give COLUMN name
            System.out.println(rs.getString(2)); // or you can give COLUMN index (indexes in DB SQL starts from 0 and 1)


            System.out.println("-------------------------");
            // boolean next() --- > since itk returns BOOLEAN, we can it in loop
            // Jumps -> check if there is next row in ResultSet - > if yes: TRUE / if no: FALSE
            while (rs.next()) {
                System.out.println("First Names: " + rs.getString("FIrst_NAME") + "\t\tLast Names: " + rs.getString("LAST_NAME"));
            }

            // This will give an error because we are at the after last row and there is not data.
            //System.out.println(rs.getString("first_name")); // you cna either give COLUMN name


            //rs.first(); // this wil jump back to the first row
            // This will still give an error because we need to implement the code to be able to jump through raws.
            //System.out.println(rs.getString("first_name"));


        }
    }

