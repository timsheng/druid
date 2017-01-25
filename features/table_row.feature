Feature: Table Row

  Background:
    Given I am on the static elements page

  Scenario: Retrieving the text from a table row
    When I retrieve the data from the table row
    Then the row data should be "Data1 Data2"

  Scenario Outline: Locating table rows on the Page
    When I search for the table row by "<search_by>"
    Then the row data should be "Data1 Data2"

  Examples:
  | search_by |
  | id        |
  | class     |
  | xpath     |
  | css       |
  | text      |
  | index     |

  Scenario: Locating table row using multiple parameters
    When I retrieve a table row element by "class" and "index"
    Then the row data should be "Data1 Data2"

  Scenario: Finding a table row dynamically
    When I retrieve a table row element while the script is executing
    Then I should see that the row exists
    And the row data should be "Data1 Data2"
