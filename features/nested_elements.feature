Feature: Attributes on Elements

  Background:
    Given I am on the nested elements page

  Scenario: Finding a link within a div
    When I search for a link located in a div
    Then I should be able to click the nested link

  Scenario: Finding a button within a div
    When I search for a button located in a div
    Then I should be able to click the nested button

  @debug
  Scenario: Finding a text field within a div
    When I search for a text field located in a div
    Then I should be able to type "123abc" in the nested text field
