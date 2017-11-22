*** Settings ***
Documentation     To test basic calculation on Windows 10 Kobo Reader app
Suite Setup       Open Calculator App
Suite Teardown    Close Calculator App
Resource          ../Resources/Common.robot
Resource          ../Resources/KoboReaderApp.robot
Library           AppiumLibrary    timeout=10

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}    WindowsPC
${PLATFORM_NAME}    Windows
${APP_ID}         jp.co.sharp.ebook.ebookapp_h35559jr9hy9m!App

*** Test Cases ***
Try to view a book which hasn't been purchased yet
    Open book from Recent Reads
    Click to open chapter menu
    Open chapter two from chapter menu
    Verify content is blocked

Open a book and go forward 3 pages then go backword 2 pages
    [Tags]  w
    Open book from Recent Reads
    Click to open chapter menu
    Open Title Unavailable section from chapter menu
    repeat keyword  3 times  Click To Move Page Forward_cordinate
    sleep  1s
    capture page screenshot
    repeat keyword  2 times  click to move page backward_cordinate
    sleep  1s
    capture page screenshot
