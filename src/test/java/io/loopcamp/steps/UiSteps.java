package io.loopcamp.steps;

import io.cucumber.java.en.*;
import io.loopcamp.pages.LoginPage;
import io.loopcamp.pages.UserPage;
import io.loopcamp.util.BrowserUtil;
import io.loopcamp.util.ConfigurationReader;
import io.loopcamp.util.Driver;
import org.apache.hc.core5.http.ConnectionReuseStrategy;

import java.sql.Connection;

public class UiSteps {
    UserPage userPage;
    static String uiTotalCount;

    @Given("the {string} on the home page")
    public void the_on_the_home_page(String userType) {
        Driver.getDriver().get(ConfigurationReader.getProperty("docuportUiUrl"));
        LoginPage loginPage = new LoginPage();
        loginPage.loginPage(userType);
    }

    @Given("the user navigates to {string} page")
    public void the_user_navigates_to_page(String moduleName) {
        userPage = new UserPage();
        userPage.clickModule(moduleName);
        BrowserUtil.waitFor(3);

    }

    @When("the user gets total user count")
    public void the_user_gets_total_user_count() {
        userPage.searchButton.click();
        BrowserUtil.waitFor(2);
        userPage.clickRadioButton("All");
        userPage.searchFilter.click();
        BrowserUtil.waitFor(2);

        String pagination = userPage.pagination.getText(); // 1-10 of 1508
        int indexOfLastSpace = pagination.lastIndexOf(" ");
        uiTotalCount = pagination.substring(indexOfLastSpace+1);

    }





}