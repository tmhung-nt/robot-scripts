*** Settings ***
Library  Selenium2Library


*** Keywords ***
Click Product Link
    [Documentation]  Click on the first product on the search result
    click element    xpath=.//*[@id='result_0']/*//a/h2
    wait until page contains  Back to search results for

