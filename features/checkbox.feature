Feature: Check Box
  In order to interact with check boxes
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a checkbox
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
    | value     |

  Scenario: Retrieve a CheckBox
    When I retrieve a check box element
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: Locating check boxes using multiple paramters
    When I search for the check box by "<param1>" and "<param2>"
    Then I should be able to check the check box

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a check box dynamically
    When I select the first check box while the script is executing
    Then I should see that the checkbox exists
    And the First check box should be selected
