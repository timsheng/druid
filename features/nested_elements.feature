Feature: Attributes on Elements

  Background:
    Given I am on the nested elements page

  Scenario: Finding a link with a div
    When I search for a link located in a div with id "div_id"
    Then I should be able to click the link
