*** Settings ***
Library           Selenium2Library

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains    Back to search results
    Capture Page Screenshot

Add to Cart
    Click Button    id=add-to-cart-button
