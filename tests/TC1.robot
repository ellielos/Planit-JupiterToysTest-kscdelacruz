*** Settings ***
Library     SeleniumLibrary
Variables  ../Resources/PageObjects/Locators.py
Variables  ../Resources/PageObjects/Messages.py
Resource   ../Resources/Keywords/JupiterToysKeywords.robot
Resource   ../Resources/Keywords/utils.robot

*** Test Cases ***
Scenario: Verify display of error messages upon submitting null data in contact page
    Given I am in Jupiter Toys Homepage
    When I go to Contact page
    And I click submit button
    Then Error messages for required fields should be displayed

Scenario: Validate error message for wrong email format
    Given I am in Contact page
    When I input data in required fields
    And Email address is not in correct format
    Then Email address format error should be displayed

Scenario: Validate error messages are gone after inputting correct data on required fields
    Given I am in Contact page
    When I input correct data in all required fields
    Then Error messages should not be displayed