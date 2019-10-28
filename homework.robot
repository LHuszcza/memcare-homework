*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary

*** Variables ***
${site_address}    http://automationpractice.com
${first_name}     liliana
${last_name}      huszcza
${address}        gorskiego 6
${password}       somepassword
${city}           Portland
${postal_code}    97035
${phone_nr}       123456789

*** Test Cases ***
CreateNewAccount
    Open Browser    ${site_address}    chrome
    Maximize Browser Window
    Wait Until Page Contains    Sign in
    Click Link    //a[contains(text(),'Sign in')]
    Wait Until Page Contains    Create an account
    ${email}=    Email    fakegmail.com
    Log    ${email}
    Input Text    //input[@name='email_create']    ${email}
    Click Button    //*[contains(@id,'SubmitCreate')]
    Wait Until Page Contains    Your personal information
    Input Text    //input[@name='customer_firstname']    ${first_name}
    Input Text    //input[@name='customer_lastname']    ${last_name}
    Input Password    //input[@name='passwd']    ${password}
    Input Text    //input[@name='address1']    ${address}
    Input Text    //input[@name='city']    ${city}
    Select From List By Value    id_state    37    # Selects Oregon
    Input Text    //input[@name='postcode']    ${postal_code}
    Select From List By Value    id_country    21    # Selects US
    Input Text    //input[@name='phone_mobile']    ${phone_nr}
    Click Button    //*[contains(@id,'submitAccount')]
    Wait Until Page Contains    My account
    [Teardown]    Close Browser
