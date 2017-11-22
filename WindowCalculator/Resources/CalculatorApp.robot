*** Settings ***
Library           AppiumLibrary    timeout=120
Library           OperatingSystem
Resource  ./PO/MathOperations.robot
Resource  ./PO/OtherOperations.robot

*** Keywords ***

Open Calculator App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}

Close Calculator App
    close application


Calculate On Two Numbers
    [Arguments]    ${mathOperation}  ${number1}    ${number2}    ${expectedResult}
    [Documentation]    param1 and param2 should be the locator of two numbers. The third param is the expected result
    Clear Current Display
    Press Button    ${number1}
    Select Math Operation  ${mathOperation}
    Press Button    ${number2}
    Verify Calculation Result  ${expectedResult}

Get Page Source
    [Arguments]  ${page_name}
    [Documentation]  Get XML Page Source Of Current Working Window
    ${_source} =  get source
    LOG  ${_source}
    create file  ${page_name}.xml   ${_source}

