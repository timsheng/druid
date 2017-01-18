Feature: File Field

  Background:
    Given I am on the static elements page

  Scenario: Setting the value on the file Field
    When I set the file field to the step definition file
    Then This filefield element should exist

  Scenario Outline: Locating file fields on the Page
    When I search for the file field by "<search_by>"
    Then I should be able to set the file field

    Examples:
    | search_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | title     |
    | index     |
    | label     |
    | css       |

  Scenario Outline: Locating file fields using multiple parameters
    When I search for the file field by "<param1>" and "<param2>"
    Then I should be able to set the file field

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a file field dynamically
    When I locate a file field while the script is executing
    Then I should see that the file field element exists
    And The file field should exist
