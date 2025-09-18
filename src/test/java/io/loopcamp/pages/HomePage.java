package io.loopcamp.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HomePage extends BasePage {
    @FindBy(xpath = "(//a[@class='doc-card style-1'])[1]")
    public WebElement recDocCard;


    // add all other locators for Home page ....

    @FindBy(xpath = "//span[text()='My uploads']") // (//a[@class='doc-card style-1'])[2]
    public WebElement myUploads;

    @FindBy(xpath = "//span[text()='Clients']")
    public WebElement clients;

    @FindBy(xpath = "//span[text()='Invitations']")
    public WebElement invitations;

    @FindBy(xpath = "//span[text()='Users']")
    public WebElement users;

    @FindBy(xpath = "//span[text()='Leads']")
    public WebElement leads;

    @FindBy(xpath = "(//span[text()='Bookkeeping'])[1]")
    public WebElement bookkeeping1;

    @FindBy(xpath = "(//span[text()='Bookkeeping'])[2]")
    public WebElement bookkeeping2;

    @FindBy (xpath = "//span[text()='1099 Form']")
    public WebElement form1099;

    @FindBy (xpath = "//span[text()='Reconciliations']")
    public WebElement reconciliations;


}