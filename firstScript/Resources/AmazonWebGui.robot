*** Settings ***
Resource          PO/LandingPage.robot
Resource          PO/TopNav.robot
Resource          PO/SearchResults.robot
Resource          PO/Product.robot
Resource          PO/Cart.robot
Resource          PO/SignIn.robot


*** Keywords ***
Search for product
    LandingPage.Load
    TopNav.Enter Search Product
    TopNav.Submit Search Form

Select product from search result
    SearchResults.Click Product Link

Add product to cart
    Product.Add Product to Cart

Begin Checkout
    Cart.Proceed To Checkout
    SignIn.Verify Page Loaded

