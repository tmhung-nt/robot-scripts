*** Settings ***
Documentation     Example test cases using robot frame-work and pywinauto.
Library           notepad.py
*** Test Cases ***  
[TC-001] Launch Notepad Apllication
	start notepad
[TC-002] Input the welcome content to notepad
	welcome to robot framework
[TC-003] Close file and click save button
	[Tags]		try
	close file and click save
[TC-003] Input filename and save
	[Tags]		debug
	input file name and save
*** Keywords ***
