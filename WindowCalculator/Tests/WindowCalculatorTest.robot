*** Settings ***
Documentation     To test basic calculation on Windows 10 Native Calculator app
Library           AppiumLibrary
Resource          ../Resources/CalculatorApp.robot


Suite Setup       CalculatorApp.Open Calculator App
Suite Teardown    CalculatorApp.Close Calculator App

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}    WindowsPC
${PLATFORM_NAME}    Windows
${APP_ID}         Microsoft.WindowsCalculator_8wekyb3d8bbwe!App

*** Test Cases ***
Test Addition Operation
    [Tags]  w
    Get Page Source     calculator
    Calculate On Two Numbers  Add  One  Seven  8

Test Minus Operation
    Calculate On Two Numbers  Minus  Nine  Three  5

Test Multiplication Operation
    Calculate On Two Numbers  Multiply  Two  Four  8

Test Division Operation
    Calculate On Two Numbers  Divide  Six  Two  3
