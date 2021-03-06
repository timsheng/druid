Feature: Unordered list

  Background:
    Given I am on the static elements page

  Scenario: Getting the first element from the unordered list
    When I get the first item from the unordered list
    Then the list item's text should be "Item One"

  @name
  Scenario Outline: Locating unordered lists on the page
    When I locate the unordered list by "<locate_by>"
    And I get the first item from the list
    Then the list item's text should be "Item One"
    And the list should contain 3 items
    And each item should contain "Item"

  Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
    | css       |

  @multi
  Scenario Outline: Locating unordered lists using multiple parameters
    When I search for the unordered list by "<param1>" and "<param2>"
    And I get the first item from the list
    Then the list items text should be "Item One"

    Examples:
    | param1  | param2  |
    | class   | index   |

  @locator
  Scenario: Finding a unordered list dynamically
    When I search for the unordered list while the script is executing
    Then I should see that the unordered list exists
    When I get the first item from the list
    Then the list items text should be "Item One"

  Scenario: Getting the text from an unordered list
    Then the text for the unordered list should contain "Item One"
    And the text for the unordered list should contain "Item Two"
    And the text for the unordered list should contain "Item Three"
