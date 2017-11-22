*** Settings ***
Resource          Resources/VariableRepository.robot

*** Variables ***
${variable_1}     from script file

*** Test Cases ***
Create and log a variable
    ${variable_1}   set variable   aladksj
    log    ${variable_1}

Access a variable
    [Tags]    w
    Log    ${variable_1}
