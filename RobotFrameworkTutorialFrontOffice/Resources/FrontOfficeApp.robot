*** Settings ***
Resource          ../Resources/PO/TopNav.robot
Resource          ../Resources/PO/TeamPage.robot
Resource          ../Resources/PO/Landing.robot

*** Keywords ***
Open Front Office Page
    Landing.Navigate to    ${URL}
    Landing.Verify Page Load

Access Team Page
    #    Landing.Open Front Office Page    ${URL}
    TopNav.Select "Team" page
    TeamPage.Verify "Team" Page Content
