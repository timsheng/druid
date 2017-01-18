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
    | action    |
    | css       |

  @multi
  Scenario Outline: Locating table using multiple parameters
    When I locate the form using "<param1>" and "<param2>"
    Then I should be able to submit the form

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a form dynamically
    When I locate a form while the script is executing
    Then I should see that the form exists
    And I should be able to submit the form
