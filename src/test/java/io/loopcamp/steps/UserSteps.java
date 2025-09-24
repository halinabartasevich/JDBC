package io.loopcamp.steps;

import io.cucumber.java.en.*;
import io.loopcamp.util.DB_Utility;
import org.junit.Assert;

public class UserSteps {

    @Then("verify user count information match in DB")
    public void verify_user_count_information_match_in_db() {

       // DB_Utility.docuportCreateConnection();
        DB_Utility.runQuery("SELECT COUNT(*) FROM identity.users");
        String dbTotalCount = DB_Utility.getCellValue(1, 1);
        System.out.println("UI Total count: " + UiSteps.uiTotalCount);
        System.out.println("DB Total count: " + dbTotalCount);

        Assert.assertEquals(dbTotalCount, UiSteps.uiTotalCount);

    }

}