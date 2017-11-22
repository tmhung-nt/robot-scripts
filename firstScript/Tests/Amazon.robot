*** Settings ***
Documentation     This is some basic info about the whole suite
Suite Setup       Common.Insret Testing Data
Suite Teardown    Common.Cleanup Tessting Data
Test Setup        Common.Begin Web Test
Test Teardown     Common.End Web Test
Resource          ../Resources/AmazonWebGui.robot
Resource          ../Resources/Common.robot

*** Variables ***

*** Test Cases ***
User Search For Product
    [Documentation]    User should be able to search for a product
    AmazonWebGui.Search for product

User must sign in to check out
    [Documentation]    User should be asked to login to check out
    [Tags]    Smoke
    AmazonWebGui.Search for product
    AmazonWebGui.Select product from search result
    AmazonWebGui.Add product to cart
    AmazonWebGui.Begin Checkout
