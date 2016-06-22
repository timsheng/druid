Feature: Page level actions
  In order to act on pages from a web site
  Testers will need to use the page object to encapsulate access

  Scenario: Getting the text from a web page
    Given I am on the static elements page
    Then the page should contain the text "Static Elements Page"

  Scenario: Getting the html from a web page
    Given I am on the static elements page
    Then the page should contain the html "<title>Static Elements Page</title>"

  Scenario: Getting the title from a web page
    Given I am on the static elements page
    Then the page should have the title "Static Elements Page"

  Scenario: Going to baidu.com from a web page
    Given I am on the static elements page
    Then I am able to go to baidu.com

  Scenario: Going to baidu.com by default
    Given I can goto baidu.com by default
    Then the page should have the title "百度"

  Scenario: Using the visit_page methods without block
    Given I can goto baidu.com using visit_page without block
    Then the page should have the title "百度" using on_page without block

  Scenario: Using the visit_page methods with block
    Given I can goto baidu.com using visit_page with block
    Then the page should have the title "百度" using on_page with block

  Scenario: Waiting for something
    Given I am on the static elements page
    Then I should be able to wait for a block to return true

  @dev
  Scenario: Handling Alerts
    Given I am on the static elements page
    When I handle the alert
    Then I should be able to get the alert's message
