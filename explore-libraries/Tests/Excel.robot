*** Settings ***
Documentation  These are some Excel tests
Library  ExcelLibrary

# Many ways to run:
# pybot -d results/excel tests/Excel.robot
# pybot -d results/excel -i Excel tests
# pybot -d results tests

*** Variables ***
${EXCEL_PATH} =  C:\\development\\robot-scripts\\explore-libraries\\Inputs\\Excel\\demo.xls

*** Test Cases ***
Open and Modify Excel File
    [Tags]  Excel
    Open Excel  ${EXCEL_PATH}
    ${cell_data} =  Read Cell Data By Name  Sheet1  A1
    ${new_cell_data} =  Catenate  ${cell_data}  Bar
    Put String To Cell  Sheet1  0  0  ${new_cell_data}
    # for some reason, trying to save the same file you've opened & modded is failing
    Save Excel  ${EXCEL_PATH}