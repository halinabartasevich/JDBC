package io.loopcamp.pages;

import io.loopcamp.util.BrowserUtil;
import io.loopcamp.util.Driver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

public class LeadsPage extends BasePage {



    public List <String> takeColumnData (String columnName){

        List <String> allColumnData = new LinkedList<>();

        List<WebElement> elementList = Driver.getDriver().findElements(By.xpath(
                "//table//tbody//tr/td[count(//table//th[normalize-space()='" + columnName + "']/preceding-sibling::th)+1]"));

        for (WebElement eachElement : elementList) {
            allColumnData.add( eachElement.getText() );
        }

        Collections.sort(allColumnData);
        return allColumnData;

    }


}