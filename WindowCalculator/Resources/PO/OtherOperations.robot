*** Settings ***
Library           AppiumLibrary



*** Keywords ***
Clear Current Display
    click element    name=Clear

Press Button
    [Arguments]    ${number}
    click element    name=${number}
    ${_text} =    Get Display Text
    Log Many    Current Display Text is:    ${_text}


Get Display Text
    ${elementText} =    get text    accessibility_id=CalculatorResults
    [Return]    ${elementText}

Get Calculation Result
    click element    name=Equals
    ${elementText} =    get text    accessibility_id=CalculatorResults
    [Return]    ${elementText}

Verify Calculation Result
    [Arguments]  ${expectedResult}
    ${calculationResult} =    Get Calculation Result
    should be equal as strings    ${calculationResult}    Display is ${expectedResult}