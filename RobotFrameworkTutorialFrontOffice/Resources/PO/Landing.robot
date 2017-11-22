*** Settings ***
Library           Selenium2Library
Resource          TeamPage.robot

*** Variables ***
${Landing_header_text}    RobotFrameworkTutorial.com Test Client

*** Keywords ***
Navigate to
    [Arguments]    ${url}
    Go to    ${url}

Verify Page Load
    Wait Until Page Contains    ${Landing_header_text}
