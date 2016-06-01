Feature: Page level actions
  In order to act on pages from a web site
  Testers will need to use the page object to encapsulate access

  Scenario: Getting the text from a web page
    Given I am on the static elements page
    Then the page should contain the text "Static Elements Page"

  Scenario: Getting the html from a web page
    Given I am on the static elements page
    Then the page should contain the html "<title>Static Elements Page</title>"

  @dev
  Scenario: Getting the title from a web page
    Given I am on the static elements page
    Then the page should have the title "Static Elements Page"

  Scenario: Going to baidu.com froma web page
    Given I am on the static elements page
    Then I am able to go to baidu.com

  @dev
  Scenario: Going to baidu.com by default
    Given I can goto baidu.com by default
    Then the page should have the title "百度"
