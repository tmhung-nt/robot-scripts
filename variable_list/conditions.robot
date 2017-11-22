*** Settings ***
Library  String
Library  Collections

*** Variables ***
${is_ok_button_there} =   ${FALSE}
${is_deleted_anyway} =  delete if not ye

*** Test Cases ***
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

#    robot -d Results -b debug.log conditions.robot



