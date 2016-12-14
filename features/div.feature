Feature: Div
  In order to interact with divs
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Getting the text from a div
    When I get the text from the div
    Then the text should be "page-object rocks!"

  @name
  Scenario Outline: Locating divs on the page
    When I locate the div by "<locate_by>"
    Then the text should be "page-object rocks!"

    Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
    | name      |
    | text      |

  Scenario: Getting the div element
    When I retrieve the div element
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: locating divs using multiple parameters
    When I search for the div by "<param1>" and "<param2>"
    Then the text should be "page-object rocks!"

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a div dynamically
    When I get the text from a div while the script is executing
    Then I should see that the div exists
    And the text should be "page-object rocks!"
