Feature: Elements

  Background:
    Given I am on the static elements page

  Scenario: Link element methods
    When I retrieve a link element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is "Google Search"
    And I should know it is equal to itself
    And I should know its' tag name is "a"
    And I should know the attribute "readonly" is false
    And I should know its' value is ""
    And I should be able to click it

  Scenario: Button element methods
    When I retrieve a button element
    Then I should know it exists
    And I should know it is visible
    And I should know its' value is "Click Me"
    And I should know its' text is "Click Me"
    And I should know it is equal to itself
    And I should know its' tag name is "input"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Check Box element methods
    When I retrieve a check box element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is ""
    And I should know its' value is "1"
    And I should know it is equal to itself
    And I should know its' tag name is "input"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Div element methods
    When I retrieve the div element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is "page-object rocks!"
    And I should know its' value is ""
    And I should know it is equal to itself
    And I should know its' tag name is "div"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Radio Button element methods
    When I retrieve a radio button
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is ""
    And I should know its' value is "Milk"
    And I should know it is equal to itself
    And I should know its' tag name is "input"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Select List element methods
    When I retrieve a select list
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes "Test 1"
    And I should know its' value is "option1"
    And I should know it is equal to itself
    And I should know its' tag name is "select"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Table element methods
    When I retrieve a table element
    Then I should know it is visible
    Then I should know it exists
    And I should know its' value is ""
    And I should know its' text includes "Data1"
    And I should know it is equal to itself
    And I should know its' tag name is "table"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Table Cell element methods
    When I retrieve table cell
    Then I should know it exists
    And I should know it is visible
    Then I should know its' value is ""
    And I should know its' text includes "Data4"
    And I should know it is equal to itself
    And I should know its' tag name is "td"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Text Field element methods
    When I retrieve a text field
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes ""
    And I should know its' value is ""
    And I should know it is equal to itself
    And I should know its' tag name is "input"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Image element methods
    When I get the image element
    Then I should know it exists
    Then I should know its' value is ""
    And I should know it is visible
    And I should know its' text includes ""
    And I should know it is equal to itself
    And I should know its' tag name is "img"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Hidden Field element methods
    When I retrieve the hidden field element
    Then I should know it exists
    And I should know it is not visible
    And I should know its' text includes ""
    And I should know its' value is "12345"
    And I should know it is equal to itself
    And I should know its' tag name is "input"
    And I should know the attribute "readonly" is false

  Scenario: Form element methods
    When I locate the form
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes ""
    And I should know it is equal to itself
    And I should know its' tag name is "form"
    And I should know the attribute "readonly" is false
    And I should know its' value is ""

  Scenario: Text Area element methods
    When I retrieve the text area
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes ""
    And I should know its' value is ""
    And I should know it is equal to itself
    And I should know its' tag name is "textarea"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: List item element methods
    When I retrieve a list item element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is "Item One"
    And I should know it is equal to itself
    And I should know its' tag name is "li"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Unordered List element methods
    When I retrieve a unordered list element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes "Item One"
    And I should know its' text includes "Item Two"
    And I should know its' text includes "Item Three"
    And I should know it is equal to itself
    And I should know its' tag name is "ul"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Ordered List element methods
    When I retrieve a ordered list element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text includes "Number One"
    And I should know its' text includes "Number Two"
    And I should know its' text includes "Number Three"
    And I should know it is equal to itself
    And I should know its' tag name is "ol"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Clear an element
    When I type "abcDEF" into the text field
    Then the text field should contain "abcDEF"
    When I clear the text field
    Then the text field should contain ""
