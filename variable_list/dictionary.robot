*** Settings ***
Library  Collections


*** Variables ***
&{BOOK_LOCATIONS}   book1=[11, 22]


*** Test Cases ***
Test 1
    log dictionary  ${BOOK_LOCATIONS}
    ${value_1} =  get from dictionary  ${BOOK_LOCATIONS}  book1
    log  ${value_1}

Test 2
    ${is_book2_exist} =  run keyword and return status  get from dictionary  ${BOOK_LOCATIONS}  book2
    ${value_2} =  run keyword if  ${is_book2_exist}
    ...  run keyword and return  get from dictionary  ${BOOK_LOCATIONS}  book2
    ...  ELSE  FAIL  the key you have retrieved is not exists
    log ${value_2}

Test 3
    set to dictionary  ${BOOK_LOCATIONS}  book2=[333, 222]
    ${book2_value} =  Get key's value from Dictionary  book2
    set global variable   ${BOOK_VALUE}   ${book2_value}
    log  ${book2_value}
    log  @{book2_value}[0]   # will be failed here since the value is not list-like

Test 4
    @{LIST} =  convert to list  ${BOOK_VALUE}
    log list  ${LIST}

Test 5
    @{LIST} =  convert to list  123 456 789 111
    log list  ${LIST}

Test 6
    @{LIST} =  create list  1  3  5  7
    log  ${LIST}
    log  @{LIST}[1]
    log  @{LIST}   #  LOG   1  3  5  7


*** Keywords ***
Get key's value from Dictionary
    [Arguments]  ${key}
    ${is_key_exist} =  run keyword and return status  get from dictionary  ${BOOK_LOCATIONS}  ${key}
    ${return_value} =  run keyword if  ${is_key_exist}
    ...  run keyword and return  get from dictionary  ${BOOK_LOCATIONS}  ${key}
    ...  ELSE  FAIL  the key you have retrived is not exists
# robot -d Results -b debug.log dictionary.robot