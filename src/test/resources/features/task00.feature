@test00
Feature: As a data consumer, I want the department information stored in postgress DB correctly in department table.

  Background:
    Given Establish the database connection

  @docuportDb @US1245
  Scenario: verify departments name in database
    When Execute query to get all columns for "departments"
    Then verify the below columns are listed in result for
      | tax                  |
      | bookkeeping          |
      | payroll              |
      | consultancy-services |
