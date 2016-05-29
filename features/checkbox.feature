Feature: Check Box
  In order to interact with check boxes
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting an element on the checkbox
    When I select the First check box
    Then the First check box should be selected
    When I unselect the First check box
    Then the First check box should not be selected

  Scenario Outline: Locating check boxes on the page
    When I locate the check box by "<locate_by>"
    Then I should be able to check the check box

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |

  Scenario: Retrieve a CheckBox
    When I retrieve a check box element
    Then I should know it exists
    And I should know it is visible
