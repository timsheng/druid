Feature: Button
  In order to interact with buttons
  Testers will need access and interrogation ability

  Background:
    Given I am on the static elements page

  Scenario: Clicking a button (type=submit)
    When I click the button
    Then I should be on the success page

  Scenario: Clicking a button (type=image)
    When I click the button with type image
    Then I should be on the success page

  Scenario: Clicking an image button by src
    When I click the image button using src
    Then I should be on the success page

  @name
  Scenario Outline: Locating buttons on the page
    When I locate the button by "<locate_by>"
    Then I should be able to click the button

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
    | text      |
    | value     |

  Scenario Outline: Locating real buttons on the page
    When I locate the button by "<locate_by>"
    Then I should be able to click the real button

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | index     |
    | value     |

  Scenario: Retrieve a button element
    When I retrieve a button element
    Then I should know it exists
    And I should know it is visible

  @multi
  Scenario Outline: Locating button using multiple parameters
    When I search for the button by "<param1>" and "<param2>"
    Then I should be able to click the button

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @multi
  Scenario Outline: Locating real button using multiple parameters
    When I search for the button by "<param1>" and "<param2>"
    Then I should be able to click the real button

    Examples:
    | param1  | param2  |
    | class   | index   |
    | name    | index   |

  @locator
  Scenario: Finding a button dynamically
    When I find a button while the script is executing
    Then I should be able to click the button element
