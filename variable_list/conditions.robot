*** Settings ***
Library  String
Library  Collections

*** Variables ***
${is_ok_button_there} =   ${FALSE}
${is_deleted_anyway} =  delete if not ye

*** Test Cases ***
Test Condition 0
    ${locator_number} =  set variable  10
    ${text_number} =  set variable  51
    Run keyword if  ${locator_number} >= ${text_number}   FAIL  "Locator Text Number" is not less than "input text"

Test condition 1
    run keyword if  ${is_ok_button_there} and '${is_deleted_anyway}' == 'delete if not yet'
    ...   log to console  true-true
    ...   ELSE IF  ${is_ok_button_there} and '${is_deleted_anyway}' != 'delete if not yet'
    ...   log to console  true-false
    ...   ELSE   log to console  false-any

    LOG TO CONSOLE  ${TEST NAME}

     @{short_test_case_name} =    Split String  ${TEST NAME}
     log list  ${short_test_case_name}

Test condition 2
    run keyword if  not ${is_ok_button_there}  log to console  ABC
    set global variable  ${VAR1}  ${TRUE}
    set global variable  ${VAR2}  ${FALSE}
    set global variable  ${VAR3}  ${TRUE}
    set global variable  ${VAR4}  ${False}

    LOG MANY  ${VAR1}   ${VAR2}     ${VAR3}     ${VAR4}

    @{list} =  Split String   ${TEST NAME}

Test Condition 3
    ${descreased} =  set variable  ${TRUE}
    ${inscreased} =  set variable  ${FALSE}

    ${results} =  evaluate  ${descreased} and ${inscreased}

    run keyword if  ${results}  FAIL  NOT TRUE AT ALL

Test Condition 4
    ${boolean} =  set variable  ${FALSE}
    ${boolean} =  run keyword unless  ${boolean}  set variable  ${FALSE}
    run keyword unless  ${boolean}  FAIL  ${boolean} is FALSE

Test Condition 5
    ${boolean} =  set variable  ${TRUE}
    ${boolean} =  run keyword if  ${boolean}   return from keyword

    run keyword unless  ${boolean}  FAIL  ${boolean} is FALSE


Test 3
    ${no} =  set variable  1
    run keyword if  ${no} == 1  log to console  abc


#    robot -d Results -b debug.log conditions.robot



