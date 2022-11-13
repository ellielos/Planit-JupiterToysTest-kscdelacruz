*** Settings ***
Library     SeleniumLibrary
Variables  ../Resources/PageObjects/Locators.py
Variables  ../Resources/PageObjects/Messages.py
Resource   ../Resources/Keywords/JupiterToysKeywords.robot
Resource   ../Resources/Keywords/utils.robot
Variables  ../Resources/TestData/TestData.py


*** Test Cases ***
Scenario: Verify Cart Computations
    [Tags]      Regression
    Given I am in Jupiter Toys Homepage
    When I go to Shop page
    And I get the product price on Shop page
    And I buy 2 stuffed Frog, 5 Fluffy Bunny and 3 Valentine Bear
    And I go to Cart Page
    Then The price of each product should be correct
    And Sub-total for each product should be correct
    And Total of all products should be correct