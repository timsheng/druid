Feature: File Field

  Background:
    Given I am on the static elements page

  Scenario: Setting the value on the file Field
    When I set the file field to the step definition file
    Then This filefield element should exist
