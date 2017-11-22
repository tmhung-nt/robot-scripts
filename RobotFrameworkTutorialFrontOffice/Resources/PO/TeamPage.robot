*** Settings ***
Library           Selenium2Library

*** Variables ***
${teamPage_Intro_Text}    OUR AMAZING TEAM
${team_header_locator}    xpath=.//*[@id='team']/div/div[1]/div/h2

*** Keywords ***
Verify "Team" Page Content
    ${ElementText}    Get Text    ${team_header_locator}
    Should Be Equal As Strings    ${ElementText}    ${teamPage_Intro_Text}    ignore_case=true
    #    Wait Until Element Contains    ${team_header_locator}    ${teamPage_Intro_Text}
    Sleep    1
    Capture Page Screenshot

Verify Page Load
    Wait Until Page Contains Element    ${team_header_locator}
