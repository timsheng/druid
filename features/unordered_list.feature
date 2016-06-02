Feature: Unordered list

  Background:
    Given I am on the static elements page

  Scenario: Getting the first element from the unordered list
    When I get the first item from the unordered list
    Then the list item's text should be "Item One"

  @dev
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
