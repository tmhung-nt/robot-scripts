*** Settings ***
Library           AppiumLibrary



*** Keywords ***
Add Operation
    click element    name=Plus

Minus Operation
    click element    name=Minus

Multiply By Operation
    click element    name=Multiply by

Divide By Operation
    click element    name=Divide by


Select Math Operation
    [Documentation]  input value should be from 1 to 4 which is Add, Minus, Multiply By and Divide By
    [Arguments]     ${input_value}
    run keyword if  '${input_value}' == 'Add'         Add Operation
    run keyword if  '${input_value}' == 'Minus'       Minus Operation
    run keyword if  '${input_value}' == 'Multiply'    Multiply By Operation
    run keyword if  '${input_value}' == 'Divide'      Divide By Operation
