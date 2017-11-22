*** Settings ***
Suite Setup       Common.Begin Web Test
Suite Teardown     Common.End Web Test
Resource          ../Resources/TMAvoteApp.robot
Resource          ../Resources/Common.robot

*** Variables ***

*** Test Cases ***
Vote DC11 products
    repeat keyword  100 times  TMAvoteApp.VoteProducts

*** Keywords ***
