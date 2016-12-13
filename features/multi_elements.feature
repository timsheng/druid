Feature: Multi Elements

   Background:
     Given I am on the multi elements page

   Scenario: Selecting buttons
     When I select the buttons with class "button"
     Then I should have 3 buttons
     And the value of button 1 should be "Button 1"
     And the value of button 2 should be "Button 2"
     And the value of button 3 should be "Button 3"


   Scenario: Selecting text_fields
     When I select the text fields with class "textfield"
     Then I should have 3 text fields
     And the value of text field 1 should be "text 1"
     And the value of text field 2 should be "text 2"
     And the value of text field 3 should be "text 3"

   Scenario: Selecting hidden_fields
     When I select the hidden fields with class "hiddenfield"
     Then I should have 3 hidden fields
     And the value of hidden field 1 should be "hidden 1"
     And the value of hidden field 2 should be "hidden 2"
     And the value of hidden field 3 should be "hidden 3"

   Scenario: Selecting text_areas
     When I select the text areas with class "textarea"
     Then I should have 3 text areas
     And the value of text area 1 should be "textarea 1"
     And the value of text area 2 should be "textarea 2"
     And the value of text area 3 should be "textarea 3"

   Scenario: Selecting select_lists
     When I select the select lists with class "selectlist"
     Then I should have 3 select lists
     And the value of select list 1 should be "selectlist 1"
     And the value of select list 2 should be "selectlist 2"
     And the value of select list 3 should be "selectlist 3"

   Scenario: Selecting links
     When I select the link with class "link"
     Then I should have 3 links
     And the text of link 1 should be "link 1"
     And the text of link 2 should be "link 2"
     And the text of link 3 should be "link 3"

   Scenario: Selecting checkboxes
     When I select the check boxes with class "checkbox"
     Then I should have 3 checkboxes
     And the value of checkbox 1 should be "checkbox 1"
     And the value of checkbox 2 should be "checkbox 2"
     And the value of checkbox 3 should be "checkbox 3"

   Scenario: Selecting radio buttons
     When I select the radio buttons with class "radio"
     Then I should have 3 radio buttons
     And the value of radio button 1 should be "radio 1"
     And the value of radio button 2 should be "radio 2"
     And the value of radio button 3 should be "radio 3"

   Scenario: Selecting divs
     When I select the divs with class "div"
     Then I should have 3 divs
     And the text of div 1 should be "Div 1"
     And the text of div 2 should be "Div 2"
     And the text of div 3 should be "Div 3"

   Scenario: Selecting spans
     When I select the spans with class "span"
     Then I should have 3 spans
     And the text of span 1 should be "Span 1"
     And the text of span 2 should be "Span 2"
     And the text of span 3 should be "Span 3"

   Scenario: Selecting tables
     When I select the tables with class "table"
     Then I should have 3 tables
     And the first row first column for table 1 should have "Data 1"
     And the first row first column for table 2 should have "Data 4"
     And the first row first column for table 3 should have "Data 7"

   Scenario: Selecting cells
     When I select the cells with class "td"
     Then I should have 3 cells
     And the text for cell 1 should be "Data 1"
     And the text for cell 2 should be "Data 2"
     And the text for cell 3 should be "Data 3"

   Scenario: Selecting images
     When I select the images with class "image"
     Then I should have 3 images
     And the alt for image 1 should be "image 1"
     And the alt for image 2 should be "image 2"
     And the alt for image 3 should be "image 3"

   Scenario: Selecting forms
     When I select the forms with class "form"
     Then I should have 3 forms
     And the action for form 1 should be "form1"
     And the action for form 2 should be "form2"
     And the action for form 3 should be "form3"

   Scenario: selecting list items
     When I select the list items with class "li"
     Then I should have 3 list items
     And the text for list item 1 should be "Item One"
     And the text for list item 2 should be "Item Two"
     And the text for list item 3 should be "Item Three"
