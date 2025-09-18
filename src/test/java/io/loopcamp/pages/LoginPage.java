package io.loopcamp.pages;

import io.loopcamp.util.ConfigurationReader;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class LoginPage extends BasePage {


    @FindBy(xpath = "//input[@type='text']")
    public WebElement username;


    @FindBy(xpath = "//input[@type='password']")
    public WebElement password;


    @FindBy (xpath = "//span[.=' Log in ']")
    public WebElement loginButton;


    public void loginPage(String userType) {

        String username;
        String password;

        switch (userType.toLowerCase()){
            case "advisor":
                username = ConfigurationReader.getProperty("docuport_advisor_username");
                password = ConfigurationReader.getProperty("docuport_advisor_password");
                break;
            case "supervisor":
                username = ConfigurationReader.getProperty("docuport_supervisor_username");
                password = ConfigurationReader.getProperty("docuport_supervisor_password");
                break;
            default:
                throw new RuntimeException("Unsupported user type: " + userType);
        }

        this.username.sendKeys(username);
        this.password.sendKeys(password);
        this.loginButton.click();

    }

}