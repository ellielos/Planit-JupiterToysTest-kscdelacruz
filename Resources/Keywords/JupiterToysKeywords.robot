*** Settings ***
Variables  ../TestData/TestData.py
Library     Collections

*** Variables ***
@{price_list}
${shop_frog_price}
${shop_bunny_price}
${shop_vbear_price}
${cart_frog_price}
${cart_bunny_price}
${cart_vbear_price}
${frog_subtotal_price}
${bunny_subtotal_price}
${vbear_subtotal_price}
${total_price}

*** Keywords ***
I get the product price on Shop page
    ${shop_frog_price} =    Get Text     ${lbl_frog_price}
    ${actual_frog_price} =  Get Price String As Integer     ${shop_frog_price}
    Set Global Variable     ${actual_frog_price}
    ${shop_bunny_price} =    Get Text     ${lbl_bunny_price}
    ${actual_bunny_price} =  Get Price String As Integer     ${shop_bunny_price}
    Set Global Variable     ${actual_bunny_price}
    ${shop_vbear_price} =    Get Text     ${lbl_vbear_price}
    ${actual_vbear_price} =  Get Price String As Integer     ${shop_vbear_price}
    Set Global Variable     ${actual_vbear_price}

The price of each product should be correct
    ${cart_frog_price} =    Get Text     ${cart_lbl_frog_price}
    ${cart_frog_price} =  Get Price String As Integer     ${cart_frog_price}
    ${cart_bunny_price} =    Get Text     ${cart_lbl_bunny_price}
    ${cart_bunny_price} =  Get Price String As Integer     ${cart_bunny_price}
    ${cart_vbear_price} =    Get Text     ${cart_lbl_vbear_price}
    ${cart_vbear_price} =  Get Price String As Integer     ${cart_vbear_price}
    Evaluate    ${actual_frog_price} == ${cart_frog_price}
    Evaluate    ${actual_bunny_price} == ${cart_bunny_price}
    Evaluate    ${actual_vbear_price} == ${cart_vbear_price}

I am in Jupiter Toys Homepage
    Set Selenium Speed  0.3 seconds
    I Open browser and navigate to URL   ${url_jupiter}     ${browser}
    Location Should Contain     ${url_jupiter}
    Maximize Browser Window

I go to Contact page
    Wait For Element and Click  ${btn_contact}
    Location Should Contain     ${url_contact}
    Wait Until Page Contains Element    ${input_forename}
    Wait Until Page Contains Element    ${input_surname}
    Wait Until Page Contains Element    ${input_email}
    Wait Until Page Contains Element    ${input_telephone}
    Wait Until Page Contains Element    ${input_message}
    Wait Until Page Contains Element    ${btn_submit}

I go to Shop page
    Wait For Element and Click  ${btn_shop}
    Location Should Contain     ${url_shop}
    Wait Until Element is Visible   ${lbl_frog_price}
    Wait Until Element is Visible   ${lbl_bunny_price}
    Wait Until Element is Visible   ${lbl_vbear_price}

I go to Cart Page
    Wait For Element and Click  ${btn_cart}
    Location Should Contain     ${url_cart}
    Wait Until Element is Visible   ${btn_checkout}
    Wait Until Element is Visible   ${btn_empty_cart}
    Element Should Be Visible   ${btn_checkout}
    Element Should Be Visible   ${btn_empty_cart}

I click submit button
    Wait For Element and Click  ${btn_submit}

Error messages for required fields should be displayed
    Page Should Contain     ${err_msg_forename}
    Page Should Contain     ${err_msg_email}
    Page Should Contain     ${err_msg_page}
    Page Should Contain     ${err_msg_page_cont}

I am in Contact Page
    Location Should Contain     ${url_contact}
    Wait Until Page Contains Element    ${input_forename}
    Wait Until Page Contains Element    ${input_surname}
    Wait Until Page Contains Element    ${input_email}
    Wait Until Page Contains Element    ${input_telephone}
    Wait Until Page Contains Element    ${input_message}
    Wait Until Page Contains Element    ${btn_submit}

I input correct data in all required fields
    Input text      ${input_forename}   ${valid_forename}
    Input text      ${input_email}      ${valid_email}
    Input text      ${input_message}    ${valid_message}

I input data in required fields
    Input text      ${input_forename}   ${valid_forename}
    Input text      ${input_message}    ${valid_message}

Error messages should not be displayed
    Page Should Not Contain     ${err_msg_forename}
    Page Should Not Contain     ${err_msg_email}
    Page Should Not Contain     ${err_msg_message}

Email address is not in correct format
    Input text      ${input_email}      ${invalid_email}

Email address format error should be displayed
    Page Should Contain     ${err_email_format}

Success message should be displayed
    Wait Until Page Contains Element    ${modal_feedback}   20 seconds
    Wait Until Page Contains Element    ${contact_success_msg}      20 seconds
    Wait Until Page Contains    ${success_msg_contact}     20 seconds
    Wait Until Page Contains    ${success_msg_contact}      20 seconds
    close browser

I buy 2 stuffed Frog, 5 Fluffy Bunny and 3 Valentine Bear
    Wait Until Element Is Visible   ${btn_frog_buy}
    Get Text    ${lbl_frog_price}
    Wait Until Element Is Visible   ${btn_bunny_buy}
    Wait Until Element Is Visible   ${btn_vbear_buy}
    ${cart_count}=  Click Element Multiple times and Verify Cart Total Count    ${btn_frog_buy}     ${frogs}    ${cart_ctr}     ${cart_count}
    ${cart_count}=  Click Element Multiple times and Verify Cart Total Count    ${btn_bunny_buy}     ${bunnies}    ${cart_ctr}     ${cart_count}
    Click Element Multiple times and Verify Cart Total Count    ${btn_vbear_buy}     ${vbears}    ${cart_ctr}     ${cart_count}

Sub-total for each product should be correct
    ${frog_subtotal_price} =    Get Text     ${cart_lbl_frog_subtotal_price}
    ${frog_subtotal_price} =  Get Price String As Integer     ${frog_subtotal_price}
    Set Global Variable     ${frog_subtotal_price}
    Evaluate    ${actual_frog_price}*${frogs} == ${frog_subtotal_price}

    ${bunny_subtotal_price} =    Get Text     ${cart_lbl_bunny_subtotal_price}
    ${bunny_subtotal_price} =  Get Price String As Integer     ${bunny_subtotal_price}
    Set Global Variable     ${bunny_subtotal_price}
    Evaluate    ${actual_bunny_price}*${bunnies} == ${bunny_subtotal_price}

    ${vbear_subtotal_price} =    Get Text     ${cart_lbl_vbear_subtotal_price}
    ${vbear_subtotal_price} =  Get Price String As Integer     ${vbear_subtotal_price}
    Set Global Variable     ${vbear_subtotal_price}
    Evaluate    ${actual_vbear_price}*${vbears} == ${vbear_subtotal_price}

Total of all products should be correct
    ${total_price} =    Get Text     ${cart_lbl_total_price}
    ${total_price} =  Remove String    ${total_price}    Total:
    ${total_price} =    Convert To Number   ${total_price}
    Evaluate    ${actual_frog_price}+${actual_bunny_price}+${actual_vbear_price} == ${total_price}