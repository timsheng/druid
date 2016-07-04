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

  Scenario: Handling alert popups
    Given I am on the static elements page
    When I handle the alert
    Then I should be able to get the alert's message

  Scenario: Handling confirm popups
    Given I am on the static elements page
    When I handle the confirm
    Then I should be able to get the confirm's message

  Scenario: Handling prompt popups
    Given I am on the static elements page
    When I handle the prompt
    Then I should be able to get the message and default value

  Scenario: Attach to window using title
    Given I am on the static elements page
    When I open a second window
    Then I should be able to attach to page object using title

  Scenario: Attach to window using url
    Given I am on the static elements page
    When I open a second window
    Then I should be able to attach to page object using url

  Scenario: Attach to widnow using index
    Given I am on the static elements page
    When I open a second window
    Then I should be able to attach to page object using index

  Scenario: Refreshing the page
    Given I am on the static elements page
    Then I should be able to refresh the page

  @dev
  Scenario: Going back and forward
    Given I am on the static elements page
    When I select the link labeled "Google Search"
    Then the page should contain the text "Success"
    When I press the back button
    Then the page should contain the text "Static Elements Page"
    When I press the forward button
    Then the page should contain the text "Success"
