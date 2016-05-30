Feature: Hidden Fields

  Background:
    Given I am on the static elements page

  Scenario: Getting a value from a hidden field
    When I retrieve the hidden field element
    Then I should see the hidden field contains "12345"

  Scenario Outline: Locating hidden fields on the Page
    When I locate the hidden field by "<locate_by>"
    Then hidden field element should contains "12345"

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | css       |
    | tag_name  |
    | index     |
    | text      |
