Feature: Elements

  Background:
    Given I am on the static elements page

  Scenario: Elements enbaled?
    When I click an enabled button
    Then it should know it is enabled
    And it should know that it is not disabled
    When I check a disabled button
    Then it should know it is not enabled
    And it should know that it is disabled

  Scenario: Setting focus and finding the element with focus
    When I set the focus to the test text_field
    Then I should know that the text_field has the focus

  Scenario: Link element methods
    When I retrieve a link element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is "Google Search"
    And I should know the html is "<a href="success.html" id="link_id" name="link_name" class="link_class" title="link_title">Google Search</a>"
    And I should know it is equal to itself
    And I should know its' tag name is "a"
    And I should know the attribute "readonly" is false
    And I should know the attribute "href" includes "success.html"
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

  Scenario: Heading element methods
    When I retrieve a heading element
    Then I should know it exists
    And I should know it is visible
    And I should know its' text is "h1's are cool"
    And I should know it is equal to itself
    And I should know its' tag name is "h1"
    And I should know the attribute "readonly" is false
    And I should be able to click it

  Scenario: Firing an event
    When I set the focus to the test text_field using the onfocus event
    Then I should see the onfocus text "changed by onfocus event"

  Scenario: Setting focus on an element
    When I set the focus on the test text_field
    Then I should see the onfocus text "changed by onfocus event"

  Scenario: Finding a parent element
    When I find the child link element
    And ask for the parent element
    Then I should have a div parent

  Scenario: Flashing an element
    When I retrieve a button element
    Then I should be able to flash it

  Scenario: Hovering over an element
    Given I am on the hover page
    When I hover over the hello link
    Then the font size should be "20px"

  Scenario: Getting an element's id
    When I retrieve a button element
    Then I should know its id is "button_id"

  Scenario: Scrolling so an element is visible
    When I retrieve a heading element
    And I scroll the heading element into view
    Then the heading element should be visible

  Scenario: Expanding how we find elemnts to include non-stardard locators
    When I retrieve a div using data-entity
    Then I should know it exists
    And I should know it is visible
    And I should know the text is "found using data-entity"

  Scenario: Accessing an HTML 5 element using the declaration
    When I retrieve the figure uisng the declaration
    Then I should see the figure contains an image

  Scenario: Accessing an HTML 5 element using the element method
    When I retrieve the figure using the element
    Then I should see the figure contains an image

  Scenario: Getting the class name for an element
    When I search for the paragraph by "id"
    Then I should know the paragraph class is "p_class"
