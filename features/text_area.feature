Feature: Text Area

  Background:
    Given I am on the static elements page

  Scenario: Setting and getting a value from a text area
    When I type "abcdefghijklmnop" into the text area
    Then the text area should contain "abcdefghijklmnop"

  Scenario Outline: Locating text area on the Page
    When I locate the text area by "<locate_by>"
    Then I should be able to type "I found it" into the area

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
    | label     |
    | css       |

  @multi
  Scenario Outline: Locating a text area using multiple parameters
    When I search for the text area by "<param1>" and "<param2>"
    Then I should be able to type "I found it" into the area

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a text area dynamically
    When I find a text area while the script is executing
    Then I should see that the text area exists
    And I should be able to type "I found it" into the area element

  Scenario: Clearing the text area
    When I type "abcdefghijklmnop" into the text area
    Then the text area should contain "abcdefghijklmnop"
    When I clear the text area
    Then the text area should contain ""
