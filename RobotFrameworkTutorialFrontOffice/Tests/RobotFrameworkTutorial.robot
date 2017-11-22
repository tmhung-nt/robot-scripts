*** Settings ***
Suite Setup       Common.Begin Web Test
Suite Teardown    Common.End Web Test
Resource          ../Resources/FrontOfficeApp.robot
Resource          ../Resources/Common.robot

*** Variables ***
${BROWSER}        ff
${URL}            http://www.robotframeworktutorial.com/front-office/

*** Test Cases ***
01_User should be able to access "Front Office" page
    [Documentation]    Open www.robotframeworkTutorial.com/front-end page then verify the heading text
    [Tags]    Test
    FrontOfficeApp.Open Front Office Page

02_"Team" page content should match requirements
    [Documentation]    Navigate to Team Menu then verify the content of Team Page
    [Tags]    Test
    FrontOfficeApp.Access Team Page
