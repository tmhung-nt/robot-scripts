*** Settings ***
Documentation  This is some basic info about the whole suite
# notice we're no longer referencing the Selenium2Library in our script!
Resource  Resources/Common.robot  # necessary for Setup & Teardown
Resource  Resources/Amazon.robot  # necessary for lower level keywords in test cases
Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the below line to Terminal window to execute
# pybot -d results tests/amazon.robot

*** Test Cases ***
Logged out user can search for products
    [Tags]  Smoke
    Amazon.Search for Products

Logged out user can view a product
    [Tags]  Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results

Logged out user can add product to cart
    [Tags]  Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart

Logged out user must sign in to check out
    [Tags]  Smoke
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart
    Amazon.Begin Checkout
