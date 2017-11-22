*** Settings ***
Library  AppiumLibrary
Library  ../Libraries/pywinAutoKeywords.py
Library  ../Libraries/KeyboardHandler.py

*** Variables ***
${MaximizeButton} =  accessibility_id=Maximize

*** Keywords ***
Click On Element
    [Arguments]  ${locator}
    wait until element is visible  ${locator}
    click element  ${locator}

Get Element Text
    [Arguments]  ${locator}
    wait until element is visible  ${locator}
    ${_text} =  get text  ${locator}
    get element attribute  ${locator}  Children
    get element location  ${locator}
    get element size  ${locator}
    Log  ${_text}
    [Return]  ${_text}


Open book from Recent Reads section And move forward
    Log    Try to launch Kobo Reader App
    #    wait until element is visible    accessibility_id=OpenMenuButton
    #    click element    accessibility_id=OpenMenuButton
    Click On Element    accessibility_id=CoverImage
#    Click To Move Page Forward
#    Click On Element    accessibility_id=GoRight
    Click On Element    name=cover
    Click On Element    name=Chapter two
    Get Element Text    accessibility_id=DescriptionTextBlock
    Get Element Text    accessibility_id=BuyNowButton
    page should contain text    Buy $
    Click On Element    accessibility_id=Back
    Click On Element    accessibility_id=Back

Open book from Recent Reads
    Click On Element    accessibility_id=CoverImage

Click to open chapter menu
    wait until element is visible  accessibility_id=GoLeft
    @{location} =  get image location  images/go_left_button.PNG
    ${start_point_x} =  evaluate   @{location}[0] + 50
    ${start_point_y} =  evaluate   @{location}[1] - 100
    click at cordinate  ${start_point_x}  ${start_point_y}


Open chapter two from chapter menu
    Click On Element    name=Chapter two

Open Title Unavailable section from chapter menu
    Click On Element    name=Title unavailable

Verify content is blocked
    Get Element Text    accessibility_id=DescriptionTextBlock
    Get Element Text    accessibility_id=BuyNowButton
    page should contain text    Buy $
    repeat keyword  2 times  Click On Element    accessibility_id=Back


Click To Move Page Backward
    press keyboard  'left'
    sleep  1s

Click To Move Page Forward
    press keyboard  'right'
    sleep  1s

Click To Move Page Backward_cordinate
    wait until element is visible  accessibility_id=GoLeft
    @{location} =  get image location  images/go_left_button.PNG
    ${start_point_x} =  evaluate   @{location}[0] - 250
    ${start_point_y} =  evaluate   @{location}[1] - 100
    click at cordinate  ${start_point_x}  ${start_point_y}

Click To Move Page Forward_cordinate
    wait until element is visible  accessibility_id=GoRight
    @{location} =  get image location  images/go_right_button.PNG
    ${start_point_x} =  evaluate   @{location}[0] + 250
    ${start_point_y} =  evaluate   @{location}[1] - 100
    click at cordinate  ${start_point_x}  ${start_point_y}
