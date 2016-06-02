Feature: Table Cell

  Background:
    Given I am on the static elements page

  Scenario: Retrieving the text from a table cell
    When I retrieve the data from the table cell
    Then the cell data should be 'Data4'

  Scenario Outline: Locating table cells on the Page
    When I locate the table cell by "<locate_by>"
    Then the cell data should be 'Data4'

    Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
    #| name      |

  Scenario: Retrieve a cell from a table by id
    When I retrieve table cell
    Then I should know it exists
    And I should know it is visible
