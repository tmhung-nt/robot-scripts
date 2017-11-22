*** Settings ***
Library  Selenium2Library


*** Keywords ***
Add Product to Cart
    wait until page contains    Add to Cart
    click element    id=mbb-offeringID-1
    click element    id=add-to-cart-button
    #    click element    id=siAddCoverage-announce
    wait until page contains    Cart subtotal