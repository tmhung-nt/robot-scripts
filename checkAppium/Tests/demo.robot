*** Settings ***
Documentation     To test mock Ebook app for SharpUC Phase 5 application
Suite Setup       Open App
Suite Teardown    Close App
Resource          ../Resources/Common.robot    #Suite Teardown    Common.Close Calculator App
Resource          ../Resources/MockEbookApp.robot
Library           AppiumLibrary    timeout=10

*** Test Cases ***
Try to open Appium
