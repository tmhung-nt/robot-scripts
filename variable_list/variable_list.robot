*** Settings ***
Library  Collections


*** Variables ***
@{My_List_Variable}    Abc    cde    asdlfk    cvzcxvmn    iudsf    239487sd    # example
&{dictionary_var}      key=value


*** Test Cases ***
Test_Pass Varaibles to keyword
    pass list to keyword  ${My_List_Variable}
    pass dictionary to keyword  ${dictionary_var}

Print List Variable
   Log    @{My_List_Variable}[0]
    Log    @{My_List_Variable}[1]
    Log    @{My_List_Variable}[2]
    Log    @{My_List_Variable}[3]
    Log    @{My_List_Variable}[4]
    Log    @{My_List_Variable}[5]

Modify List Variable Content
    @{My_List_Variable}    Set Variable    Item 1    Item 2    Item 3    Item 4
    Log    @{My_List_Variable}[0]


Check whether scalar variable is initialed
    [Tags]  test
    ${is_initialed} =   run keyword and return status  variable should not exist  ${number}
    log  ${is_initialed}
    [Return]  ${is_initialed}


Check whether list variable is initialed
    [Tags]  test
    ${is_initialed} =   run keyword and return status  variable should exist  @{number}
    log  ${is_initialed}
    [Return]  ${is_initialed}

Check whether dictionary variable is initialed
    [Tags]  test
    ${is_initialed} =   run keyword and return status  variable should exist  &{number}
    log  ${is_initialed}

    &{number} =  create dictionary
    ${is_initialed} =   run keyword and return status  variable should exist  &{number}
    log  ${is_initialed}
    [Return]  ${is_initialed}

Books's Locations dictionary
    [Tags]  test
    ${book_1_location} =  create list  ${11}   ${22}
    ${book_location} =  create dictionary    book1=${book_1_location}

    ${book_2_location} =  Calculate next book's location  @{book_1_location}
    set to dictionary  ${book_location}  book2=${book_2_location}
    log dictionary  ${book_location}
    ${book_1} =  get from dictionary  ${book_location}  book1
    ${book_2} =  get from dictionary  ${book_location}  book2

    log  @{book_1}[0]
    log  @{book_2}[1]

    ${id} =  set variable  ${1}
    ${temp} =  create dictionary

    set global variable  ${BOOKS_LOCATION_COLLECTIONS}   ${temp}

    set to dictionary  ${BOOKS_LOCATION_COLLECTIONS}  book${id}=${book_1_location}
    log dictionary  ${BOOKS_LOCATION_COLLECTIONS}

*** Keywords ***
Calculate next book's location
    [Arguments]  @{ref_book_location}
    ${x} =   evaluate  @{ref_book_location}[0] + 120
    ${y} =   evaluate  @{ref_book_location}[1] + 0
    @{new_book_location} =  create list  ${x}  ${y}
    [Return]   @{new_book_location}

Pass list to keyword
    [Arguments]  ${list}
    log  @{list}[0]


Pass dictionary to keyword
    [Arguments]  ${dictionary}
    ${value} =  get from dictionary  ${dictionary}  key
    log   ${value}

    log dictionary  ${dictionary}

