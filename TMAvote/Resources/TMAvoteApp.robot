*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            https://support.tma.com.vn/limesurvey/index.php?r=survey/index&sid=654551&lang=en
${AI_Testing_Product}    xpath=.//*[@id='javatbd654551X387X2317SQ033']/label
${AI_VoiceAssistance_Product}    xpath=.//*[@id='javatbd654551X387X2317SQ035']/label
${BROWSER}        chrome

*** Keywords ***
VoteProducts
    Go to    ${URL}
    Verify Page Load
    Select Products
    Submit Vote
    Capture Page Screenshot
    delete all cookies
    sleep  2s

Verify Page Load
    wait until page contains    Please select at most 2 answers

Select Products
    click element    ${AI_Testing_Product}
    click element    ${AI_VoiceAssistance_Product}

Submit Vote
    click element    id=movesubmitbtn
