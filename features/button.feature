Feature: Button
  In order to interact with buttons
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a button
    When I click the button
    Then I should be on the success page

  @name
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
    | value     |

  Scenario: Retrieve a button element
    When I retrieve a button element
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: Locating button using multiple parameters
    When I search for the button by "<param1>" and "<param2>"
    Then I should be able to click the button

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |
