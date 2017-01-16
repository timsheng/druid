Feature: Support for video element

  Background:
    Given I am on the static elements page

  Scenario: Finding an video element
    When I retrieve the video element
    Then I should know it exists
    And I should know it is visible

  Scenario Outline: Locating a video element on the page
    When I search for the video element by "<search_by>"
    Then I should know it is visible

    Examples:
      | search_by |
      | id        |
      | class     |
      | name      |
      | xpath     |
      | index     |

   Scenario Outline: Locating videos using multiple parameters
     When I search for the video element by "<param1>" and "<param2>"
     Then I should know it is visible

     Examples:
       | param1  | param2  |
       | class   | index   |
       | name    | index   |

   Scenario Outline: Locating videos using multiple parameters
     When I search for the video element by "<param1>" and "<param2>"
     Then I should know it is visible

    Examples:
    | param1 | param2 |
    | class  | index  |
    | name   | index  |

  Scenario: Should know if it is autoplay
    When I retrieve the video element
    Then I should know the video is not autoplay

  Scenario: Should know if the controls are displayed
    When I retrieve the video element
    Then I should know that the controls are displayed

  Scenario: Should know if it is paused
    When I retrieve the video element
    Then I should know that the video is paused

  #Scenario: Should know its duration
  #  When I retrieve the video element
  #  Then I should know that the duration is greater than 12 seconds

  #Scenario: Should know its volume
  #  When I retrieve the video element
  #  Then I should know that its volume is 1
