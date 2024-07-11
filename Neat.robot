*** Settings ***
Library     SeleniumLibrary
Variables     EnvironmentVariables.py

*** Variables ***


*** Keywords ***

*** Test Cases ***

Verify Basic Search Functionality for eBay
    [Documentation]     This test case verifies the Neat Server Login
    [Tags]     Functionality
    
    Open Browser         ${neatServerURL}       chrome
    Maximize Browser Window
   # Wait Until Element Is Visible    //*[@id="gdpr-banner-accept"]    10s    # Adjust the XPath to the actual Accept Cookies button //*[@id="gdpr-banner-accept"]
    #Scroll Element Into View    xpath=//button[contains(@id,'gdpr-banner-accept')]
    #Click Element    //*[@id="gdpr-banner-accept"]    # Adjust the XPath to the actual Accept Cookies button

    Click Element        //*[@id="details-button"]
    # Execute JavaScript    document.querySelector('button[id*="gdpr-banner-accept"]').click();
    Click Element        //*[@id="proceed-link"]

    # Check for credentials
    Wait Until Element Is Visible  xpath://input[@name="username"]  10s
    Wait Until Element Is Enabled  xpath://input[@name="username"]  10s
    Input Text  xpath://input[@name="username"]  ${neatUserName}
    Input Text    //input[@name="password"]    ${neatPassword}
    Sleep    3s
    Click Button    //input[@id="kc-login"]
    # Page Should Contain    Edge Data Center Inventory
    Sleep    10s
    Close Browser
    