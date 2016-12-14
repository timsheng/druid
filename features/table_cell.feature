Feature: Table Cell

  Background:
    Given I am on the static elements page

  Scenario: Retrieving the text from a table cell
    When I retrieve the data from the table cell
    Then the cell data should be 'Data4'

  @name
  Scenario Outline: Locating table cells on the Page
    When I locate the table cell by "<locate_by>"
    Then the cell data should be 'Data4'

    Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
    | name      |
    | text      |

  Scenario: Retrieve a cell from a table by id
    When I retrieve table cell
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: Locating table cell using multiple parameters
    When I retrieve a table cell element by "<param1>" and "<param2>"
    Then the cell data should be 'Data4'

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a table cell dynamically
    When I retrieve a table cell element while the script is executing
    Then I should see that the cell exists
    And the cell data should be 'Data4'
