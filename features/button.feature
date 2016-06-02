Feature: Button
  In order to interact with buttons
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a button
    When I click the button
    Then I should be on the success page

  Scenario Outline: Locating buttons on the page
    When I locate the button by "<locate_by>"
    Then I should be able to click the button

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
    | text      |

  Scenario: Retrieve a button element
    When I retrieve a button element
    Then I should know it exists
    And I should know it is visible

  @dev
  Scenario: Selecting a button using block
    Then I can click the button in this element
