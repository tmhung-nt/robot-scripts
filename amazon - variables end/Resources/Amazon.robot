*** Settings ***
Resource          ./Common.robot
Resource          PO/Cart.robot
Resource          PO/LandingPage.robot
Resource          PO/Product.robot
Resource          PO/SearchResults.robot
Resource          PO/SignIn.robot
Resource          PO/TopNav.robot

Library  Selenium2Library

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Search Completed

Select Product from Search Results
    SearchResults.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded
