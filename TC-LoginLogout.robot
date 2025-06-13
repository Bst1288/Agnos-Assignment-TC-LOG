*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}       https://dev.app.agnoshealth.com/ai_dashboard/login/
${DASHBOARD_URL}   https://dev.app.agnoshealth.com/ai_dashboard
${EMAIL}           test@gmail.com
${INVALID_EMAIL}   testID@gmail.com
${PASSWORD}        12345
${INVALID_PASSWORD}   67890
${ERROR_MESSAGE}   Wrong email or password. Please try again

*** Test Cases ***
#TC-LOG-001
Login with valid credentials
    Open Browser    ${LOGIN_URL}    chrome
    Input Text      xpath=//input[@type='email']      ${EMAIL}
    Input Text      xpath=//input[@type='password']   ${PASSWORD}
    Click Element   xpath=//button[normalize-space()='Sign in']
    Wait Until Location Is    ${DASHBOARD_URL}    timeout=10s
    Location Should Be         ${DASHBOARD_URL}
    Close Browser

#TC-LOG-002
Login with non-registered email	
    Open Browser    ${LOGIN_URL}    chrome
    Input Text      xpath=//input[@type='email']      ${INVALID_EMAIL}
    Input Text      xpath=//input[@type='password']   ${PASSWORD}
    Click Element   xpath=//button[normalize-space()='Sign in']
    Wait Until Page Contains    ${ERROR_MESSAGE}    timeout=5s
    Page Should Contain         ${ERROR_MESSAGE}
    Close Browser

#TC-LOG-003
Login with invalid password
    Open Browser    ${LOGIN_URL}    chrome
    Input Text      xpath=//input[@type='email']      ${EMAIL}
    Input Text      xpath=//input[@type='password']   ${INVALID_PASSWORD}
    Click Element   xpath=//button[normalize-space()='Sign in']
    Wait Until Page Contains    ${ERROR_MESSAGE}    timeout=5s
    Page Should Contain         ${ERROR_MESSAGE}
    Close Browser

#TC-LOG-004
Login with all fields empty
    Open Browser    ${LOGIN_URL}    chrome
    Element Attribute Value Should Be    xpath=//input[@type='email']      value    ${EMPTY}
    Element Attribute Value Should Be    xpath=//input[@type='password']   value    ${EMPTY}
    Element Should Be Disabled    xpath=//button[normalize-space()='Sign in']
    Close Browser

#TC-LOG-005
Login with some fields empty
    Open Browser    ${LOGIN_URL}    chrome
    Input Text      xpath=//input[@type='email']      ${EMAIL}
    Element Attribute Value Should Be    xpath=//input[@type='password']   value    ${EMPTY}
    Element Should Be Disabled    xpath=//button[normalize-space()='Sign in']
    Close Browser

#TC-LOG-006
Verify logout functionality
    #Login to AI dashboard
    Open Browser    ${LOGIN_URL}    chrome
    Input Text      xpath=//input[@type='email']      ${EMAIL}
    Input Text      xpath=//input[@type='password']   ${PASSWORD}
    Click Element   xpath=//button[normalize-space()='Sign in']
    Wait Until Location Is    ${DASHBOARD_URL}    timeout=10s
    Location Should Be         ${DASHBOARD_URL}

    #Click logout button
    Click Element   xpath=//div[contains(text(), 'Logout') or contains(text(), 'Log Out')] 
    Sleep           1s

    #Redirected to login page
    Wait Until Location Contains    ${LOGIN_URL}    timeout=10s
    Location Should Be         ${LOGIN_URL}
    Close Browser
