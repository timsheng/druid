Feature: Links
  In order to interact with Links
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a link
    When I select the link labeled "Google Search"
    Then the page should contain the text "Success"

  Scenario Outline: Locating links on the Page
    When I locate the link by "<locate_by>"
    Then I should be able to select the link

    Examples:
    | locate_by |
    | class     |
    | href      |
    | id        |
    | index     |
    | name      |
    | text      |
    | xpath     |
    | link      |
    | link_text |
    | css       |
    | title     |

  Scenario: Retrieve a Link
    When I retrieve a link element
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario: Support for multiple parameters
    When I select a link labeled "Hello" and index "0"
    Then the page should contain the text "Success"
    Given I am on the static elements page
    When I select a link labeled "Hello" and index "1"
    Then the page should contain the text "Success"

  @locator
  Scenario: Finding a link dynamically
    When I select a link while the script is executing
    And the page should contain the text "Success"

  Scenario: Getting the href for a link
    When I get the href for the link
    Then I should know it was "success.html"

  Scenario: Link element methods
    Given I am on the static elements page
    When I retrieve a link element
    Then I should be able to wait until it is present
    And I should be able to wait until it is visible
    And I should be able to wait until it is not visible
    And I should be able to wait until a block returns true
