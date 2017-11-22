*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER}  firefox

*** Keywords ***
Begin Web Test
    Log  I'm opening the web browser
    open browser    about:blank    ${BROWSER}
    Maximize browser window

End Web Test
    Log  I'm closing the web browser
    close browser

Insret Testing Data
    Log  I'm setting up the test data...

Cleanup Tessting Data
    Log  I'm cleaning up the test data...

