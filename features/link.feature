Feature: Links
  In order to interact with Links
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Selecting a link
    When I select the link labeled "Google Search"
    Then the page should contain the text "Google"

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

  Scenario: Retrieve a Link
    When I retrieve a link element
    Then I should know it exists
    And I should know it is visible
