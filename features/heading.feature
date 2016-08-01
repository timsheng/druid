Feature: Headings

   Background:
     Given I am on the static elements page

   Scenario: Getting the text of headings
     When I get the text for the "h1" element
     Then I should see "h1's are cool"

   Scenario Outline: Locating h1s on the Page
     When I search for the heading1 by "<search_by>"
     Then I should see "h1's are cool"

     Examples:
     | search_by |
     | id        |
     | class     |
     | name      |
     | xpath     |
     | index     |

   @multi
   Scenario Outline: Locating h1 using multiple parameters
     When I locate the h1 using "<param1>" and "<param2>"
     Then the text should be "h1's are cool"

     Examples:
     | param1  | param2  |
     | class   | index   |
     | name    | index   |

   @locator
   Scenario: Finding a h1 dynamically
     When I locate a h1 while the script is executing
     Then the text should be "h1's are cool"
