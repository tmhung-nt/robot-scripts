*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Page Loaded
    wait until element is visible    id=signInSubmit
    capture page screenshot