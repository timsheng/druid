Feature: Support for the audio element

  Background:
    Given I am on the static elements page

  Scenario: Finding an audio element
    When I retrieve the audio element
    Then I should know it exists
    And I should know it is visible

  Scenario Outline: Locating an audio element on the page
    When I search for the audio element by "<search_by>"
    Then I should know it is visible

    Examples:
      | search_by   |
      | id          |
      | class       |
      | name        |
      | xpath       |
      | index       |

  Scenario Outline: Locating audios using multiple parameters
    When I search for the audio element by "<param1>" and "<param2>"
    Then I should know it is visible

    Examples:
      | param1  | param2  |
      | class   | index   |
      | name    | index   |

  Scenario: Should know if it is autoplay
    When I retrieve the audio element
    Then I should know the audio is not autoplay

  Scenario: Should know if the controls are displayed
    When I retrieve the audio element
    Then I should know that the controls are displayed

  Scenario: Should know if it is paused
    When I retrieve the audio element
    Then I should know that the audio is paused

  Scenario: Should know its duration
    When I retrieve the audio element
    Then I should know that the duration is greater than 74 seconds

  Scenario: Should know its volume
    When I retrieve the audio element
    Then I should know that its volume is 1