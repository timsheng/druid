Feature: Image

  Background:
    Given I am on the static elements page

  Scenario: Getting the image element
    When I get the image element
    Then the image should be "106" pixels wide
    And the image should be "106" pixels tall

  Scenario Outline: Locating an image on the page
    When I get the image element by "<locate_by>"
    Then the image should be "106" pixels wide
    And the image should be "106" pixels tall

    Examples:
    | locate_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | index     |
