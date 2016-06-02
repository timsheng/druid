Feature: Table
  In order to interact with tables
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Retrieve a table
    When I retrieve a table element
    Then I should know it is visible
    Then I should know it exists

  Scenario Outline: Locating table cells on the Page
    When I retrieve a table element by "<locate_by>"
    Then the data for row "1" should be "Data1" and "Data2"

  Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |

  Scenario: Retrieve the data from a table
    When I retrieve a table element
    Then the data for row "1" should be "Data1" and "Data2"
    And the data for row "2" should be "Data3" and "Data4"
    And the table should have "2" rows
    And each row should contain "Data"
    And row "1" should have "2" columns
    And each column should contain "Data"
