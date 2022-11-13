*** Settings ***
Library     SeleniumLibrary
Variables  ../Resources/PageObjects/Locators.py
Variables  ../Resources/PageObjects/Messages.py
Resource   ../Resources/Keywords/JupiterToysKeywords.robot
Resource   ../Resources/Keywords/utils.robot

*** Test Cases ***
Scenario: Successful submission of data in Contact page
    [Tags]      Regression
    [Template]  Scenario Outline: Successful submission of contact form
    # Examples:
    # forename  # email         # message
    test1        test1@test.com   testmessage
    test2        test2@test.com   testmessage
    test3        test3@test.com   testmessage
    test4        test4@test.com   testmessage
    test5        test5@test.com   testmessage

*** Keywords ***
Scenario Outline: Successful submission of contact form
    [Arguments]  ${forename}    ${email}    ${message}
    Given I am in Jupiter Toys Homepage
    When I go to Contact page
    And Input text  ${input_forename}    ${forename}
    And Input text  ${input_email}       ${email}
    And Input Text  ${input_message}     ${message}
    And I click submit button
    Then Error messages should not be displayed
    And Success message should be displayed