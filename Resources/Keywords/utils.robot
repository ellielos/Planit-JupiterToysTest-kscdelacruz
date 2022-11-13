*** Settings ***
Library     String
*** Variables ***
${ctr}  0
${price}

*** Keywords ***
I open browser and navigate to URL
    [Arguments]  ${url}     ${browser}
    open browser    ${url}  ${browser}

Wait For Element and Click
    [Arguments]  ${element}
    Wait Until Element Is Visible   ${element}
    click link  ${element}

Click Element Multiple times and Verify Cart Total Count
    [Arguments]  ${element}     ${number_of_clicks}     ${element_ctr}      ${total_count}
    WHILE   ${ctr} < ${number_of clicks}
        Click Element   ${element}
        ${ctr} =    Evaluate    ${ctr} + 1
    END
    ${total_count} =  Evaluate    ${total_count} + ${number_of_clicks}
    [Return]    ${total_count}
    Element Text Should Be    ${element_ctr}     ${total_count}

Get Price String As Integer
    [Arguments]   ${price}
    ${price}=    Remove String    ${price}    $    ,
    ${value}=    Convert To Number   ${price}
    [Return]    ${value}
