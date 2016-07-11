Feature: Table
  In order to interact with tables
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Retrieve a table
    When I retrieve a table element
    Then I should know it is visible
    Then I should know it exists

  @name
  Scenario Outline: Locating table cells on the Page
    When I retrieve a table element by "<locate_by>"
    Then the data for row "1" should be "Data1" and "Data2"

  Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
    | name      |

  Scenario: Retrieve the data from a table
    When I retrieve a table element
    Then the data for row "1" should be "Data1" and "Data2"
    And the data for row "2" should be "Data3" and "Data4"
    And the table should have "2" rows
    And each row should contain "Data"
    And row "1" should have "2" columns
    And each column should contain "Data"

  @multi
  Scenario Outline: Locating table using multiple parameters
    When I retrieve a table element bys "<param1>" and "<param2>"
    Then the data for row "1" should be "Data1" and "Data2"

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a table dynamically
    When I retrieve a table element while the script is executing
    Then the data for row "1" should be "Data1" and "Data2"
