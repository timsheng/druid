Feature: Form

  Background:
    Given I am on the static elements page

  Scenario: Submitting a form
    When I locate the form by "id"
    Then I should be able to submit the form

  Scenario Outline: Locating a form on the page
    When I locate the form by "<locate_by>"
    Then I should be able to submit the form

    Examples:
    | locate_by |
    | id        |
    | class     |
    | xpath     |
    | index     |
