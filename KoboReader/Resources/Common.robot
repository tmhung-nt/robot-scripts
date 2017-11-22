
*** Settings ***
Library  AppiumLibrary

*** Keywords ***
Open Calculator App
    open application  ${APPIUM_SERVER}  alias=myApp  app=${APP_ID}  deviceName=${device_name}  platformName=${platform_name}

Close Calculator App
    close application
