*** Settings ***
Documentation     This is some basic info about the whole suite
Test Setup        Begin Web Test
Test Teardown     End Web Test
Resource          ../Resources/Common.robot
Resource          ../Resources/Amazon.robot

*** Variables ***
${BROWSER}        chrome
${START_URL}      https://www.amazon.com
${SEARCH_TERM}    Ferrari 458

*** Test Cases ***
Logged out user can search for products
    [Tags]    Current
    Amazon.Search for Products

Logged out user can view a product
    Amazon.Search for Products
    Amazon.Select Product from Search Results

Logged out user can add product to cart
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart

Logged out user must sign in to check out
    Amazon.Search for Products
    Amazon.Select Product from Search Results
    Amazon.Add Product to Cart
    Amazon.Begin Checkout
