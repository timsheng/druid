Feature: Text Fields
  In order to interact with text fields
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Setting and getting a value from a text field
    When I type "abcDEF" into the text field
    Then the text field should contain "abcDEF"

  @dev
  Scenario Outline: Locating text fields on the Page
    When I locate the text field by "<locate_by>"
    Then I should be able to type "I found it" into the field

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | css       |
    | tag_name  |
    | index     |
    | text      |
    #| value     |

  Scenario: Retrieve a text field
    When I retrieve a text field
    Then I should know it exists
    And I should know it is visible
