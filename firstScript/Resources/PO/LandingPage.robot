*** Settings ***
Library  Selenium2Library

*** Variables ***
${Start_URL}  http://amazon.com


*** Keywords ***
Load
    Go to  ${Start_URL}
    wait until page contains  Your Amazon.com
