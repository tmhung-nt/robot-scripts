*** Settings ***


*** Variables ***



*** Test Cases ***
Check Greater Than
    ${number_1} =  set variable  ${8}
    ${number_2} =  set variable  ${4}

    LOG   ${${number_1} / ${number_2}}

    ${check} =  set variable

    ${check} =  run keyword if  ${number_1} > ${number2}   set variable  ${TRUE}
    ...  ELSE   set variable  ${FALSE}


# robot -d Results CompareNumber.robot