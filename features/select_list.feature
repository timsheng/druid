Feature: Select List
  In order to interact with select lists
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting an element on the select list
    When I select "Test 2" from the select list
    Then the current item should be "Test 2"

  Scenario Outline: Locating select lists on the Page
    When I locate the select list by "<locate_by>"
    Then I should be able to select "Test 2"
    And the value for the selected item should be "Test 2"
    And the value for the option should be "option2"

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
  #  | value     |
  #  | text      |

  Scenario: Retrieve a select list
    When I retrieve a select list
    Then I should know it exists
    And I should know it is visible

  @dev
  Scenario: Iterating through the options in the select list
    When I search for the select list by "id"
    Then option "1" should contain "Test 1"
    And option "2" should contain "Test 2"
    And each option should contain "Test"

  @multi
  Scenario Outline: Locating a select list using multiple parameters
    When I search for the select list bys "<param1>" and "<param2>"
    Then I should be able to select "Test 2"
    And the value for the selected item should be "Test 2"
    And the value for the option should be "option2"

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a select list dynamically
    When I find a select list while the script is executing
    Then I should see that the select list exists
    And I should be able to select "Test 2" from the list

  Scenario: Getting the selected option
    When I select "Test 2" from the select list
    Then the selected option should be "Test 2"

  Scenario: Determining if a select list includes some options
    Then the select list should include "Test 2"

  Scenario: It should know if an option is selected
    When I select "Test 2" from the select list
    Then the select list should know that "Test 2" is selected
