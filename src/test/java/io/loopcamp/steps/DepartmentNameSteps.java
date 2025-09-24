package io.loopcamp.steps;
import io.cucumber.java.en.*;
import io.loopcamp.util.DB_Utility;
import org.junit.Assert;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class DepartmentNameSteps {

    @Given("Establish the database connection")
    public void лestablish_the_database_connection() {
      //  DB_Utility.docuportCreateConnection();
        System.out.println("**********Establish DB connection**********");
    }

    @When("Execute query to get all columns for {string}")
    public void execute_query_to_get_all_columns_for(String tableName) {
        String sql = "SELECT * FROM identity." + tableName;
        DB_Utility.runQuery(sql);
    }

    @Then("verify the below columns are listed in result for")
    public void verify_the_below_columns_are_listed_in_result_for(List<String> expDepartmentNames) {

        List <String> actualDepartmentNames = DB_Utility.getColumnDataAsList("name");

        //System.out.println("Actual department names: " + actualDepartmentNames);
        //System.out.println("Expected department names: " + expDepartmentNames);

        Assert.assertEquals(expDepartmentNames, actualDepartmentNames);

    }


    @When("Execute query to get all IDs from users")
    public void execute_query_to_get_all_i_ds_from_users() {
        String sql = "SELECT * FROM document.users";
        DB_Utility.runQuery(sql);
    }

    @Then("verify all users has unique ID")
    public void verify_all_users_has_unique_id() {
        List <String> allExistingIds = DB_Utility.getColumnDataAsList("id");
        //System.out.println("Number of unique IDs with List: " + allExistingIds.size());

        Set<String> uniqueIds = new HashSet<>(allExistingIds);
        //System.out.println("Number of unique IDs with Set: " + uniqueIds.size());
        Assert.assertEquals(allExistingIds.size(), uniqueIds.size());
    }


    @When("Execute query to get all columns")
    public void execute_query_to_get_all_columns() {
        String sql = "SELECT * FROM document.users";
        DB_Utility.runQuery(sql);
    }

    @Then("verify the below columns are listed in result")
    public void verify_the_below_columns_are_listed_in_result(List<String> expColumnNames) {
        List <String> actColumnNames =  DB_Utility.getAllColumnNamesAsList();
        Assert.assertEquals(expColumnNames, actColumnNames);
    }




}