*** Settings ***
Documentation     Example test cases using robot frame-work and pywinauto.
Library           mspaint.py


*** Test Cases ***  
[TC-001] Launch MS Paint
	start mspaint

[TC-002] Draw somthing on paint
	draw using mouse drag


[TC-003] Save the picture
	save the picture


*** Keywords ***
