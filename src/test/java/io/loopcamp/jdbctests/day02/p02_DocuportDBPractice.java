package io.loopcamp.jdbctests.day02;

import io.loopcamp.util.ConfigurationReader;
import io.loopcamp.util.DB_Utility;
import org.junit.Assert;
import org.junit.Test;
import org.junit.jupiter.api.DisplayName;

public class p02_DocuportDBPractice {
    // Connection Strings for Docuport
    String docuDbUrl = ConfigurationReader.getProperty("docuportDbUrl");
    String docuDbUsername = ConfigurationReader.getProperty("docuportDbUsername");
    String docuDbPassword = ConfigurationReader.getProperty("docuportDbPassword");


    @DisplayName("DB vs UI test")
    @Test
    public void task1() {

        // Imagine, with UI automation we got this number
        // "1-7 of 7".substring("1-7 of 7".lastIndexOf(" ")+1)
        int uiAdvisorCount = 7;

        // Here, we are getting count of Advisor users with DB automation
        DB_Utility.createConnection(docuDbUrl, docuDbUsername, docuDbPassword);
        DB_Utility.runQuery("SELECT * FROM DOCUMENT.users WHERE role_name = 'advisor'");
        int dbAdvisorCount = DB_Utility.getRowCount();


        // Validating if UI Advisor count is matching with DB Advisor count
        Assert.assertEquals(uiAdvisorCount, dbAdvisorCount);
    }


   // @Test

}