*** Settings ***
Resource          ./TeamPage.robot

*** Variables ***
${team_page_menu_locator}    Team

*** Keywords ***
Select "Team" page
    Click Link    ${team_page_menu_locator}
    TeamPage.Verify Page Load
