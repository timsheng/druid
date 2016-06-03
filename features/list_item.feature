Feature: List item

  Background:
    Given I am on the static elements page

  Scenario: Getting the text from a list item
    When I get the text from the list item
    Then the text should be "Item One"

  @dev
  Scenario Outline: Locating list items on the page
    When I locate the list item by "<locate_by>"
    Then the text should be "Item One"

  Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |

  @multi
  Scenario Outline: Locating list items using multiple parameters
    When I search for the list item by "<param1>" and "<param2>"
    Then the text should be "Item One"

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |
