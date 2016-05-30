Feature: Span

  Background:
    Given I am on the static elements page

  Scenario: Getting the text from a span
    When I get the text from the span
    Then the text should be "My alert"

  Scenario Outline: Locating spans on the page
    When I locate the span by "<locate_by>"
    Then the text should be "My alert"

    Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |

  Scenario: Retrieve a Span
    When I retrieve a span element
    Then I should know it exists
    And I should know it is visible
