Feature: Radio Buttons
  In order to interact with radio buttons
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a radio button
    When I select the "Milk" radio button
    Then the "Milk" radio button should be selected
    When I select the "Butter" radio button
    Then the "Butter" radio button should be selected

  @dev
  Scenario Outline: Locating radio buttons on the Page
    When I locate the radio button by "<locate_by>"
    And I select the radio button
    Then the "Milk" radio button should be selected

    Scenarios:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
    | value     |

  Scenario: Retrieve a radio button
    When I retrieve a radio button
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: Locating radio buttons using multiple parameters
    When I search for the radio button by "<param1>" and "<param2>"
    And I select the radio button
    Then the "Milk" radio button should be selected

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a radio button dynamically
    When I select the radio button while the script is executing
    Then I should see that the radio button exists
    And the "Milk" radio button should be selected
