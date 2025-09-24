package io.loopcamp.steps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.loopcamp.util.ConfigurationReader;
import io.loopcamp.util.DB_Utility;
import io.loopcamp.util.Driver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.util.concurrent.ConcurrentHashMap;

public class Hooks {

    @Before("@ui")
    public void setupUi () {
        Driver.getDriver().get(ConfigurationReader.getProperty("docuportUiUrl"));
    }

    @After ("@ui")
    public void tearDown (Scenario scenario) {
        if(scenario.isFailed()){
            final byte [] screenshot = ((TakesScreenshot)(Driver.getDriver())).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot,"image/png",scenario.getName());
        }

        Driver.getDriver().quit();
    }


    // The following are for DB
    @Before ("@docuportDb")
    public void setupDBForDocuport () {
        DB_Utility.docuportCreateConnection();

    }

    @Before ("@hrDb")
    public void setupDBForHR () {
        DB_Utility.docuportCreateConnection();

    }

@After ("@db")
    public void closeConnection () {
        DB_Utility.destroy();
    System.out.println("CONNECTION CLOSED");
}


}