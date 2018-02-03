*** Settings ***
Library  Collections
Library  ./log_handler.py

*** Variables ***
@{My_List_Variable}    Abc    cde    asdlfk    cvzcxvmn    iudsf    239487sd    # example
&{dictionary_var}      key=value

# robot -d Results -i fields variable_list.robot

*** Test Cases ***
Log Fields
    [tags]  fields
    ${log_msg} =  set variable  "O34GHCexjYnEcTT1S0i5wVejdh5MXiz6cClpaUd4WpFqpOA873NXT80EtZULJzMd" "GROUP08ST109" "5.0.26/18012903/w" "3" "0000000000009810" "180203211533" "B03 PDF_func" "NotOpen" "" "OpenBook" "12346tst000394" "" "" "" "" "100%(40,-1)" "" "" "" "" "" "" ""
    @{fields} =  extract fields  ${log_msg}
    ${user_id} =  set variable  @{fields}[0]
    ${student_id} =  set variable  @{fields}[1]
    ${app_version} =  set variable  @{fields}[2]
    ${log_version} =  set variable  @{fields}[3]
    ${device_id} =  set variable  @{fields}[4]
    ${timestampe} =  set variable  @{fields}[5]
    ${content_id} =  set variable  @{fields}[6]
    ${not_open} =  set variable  @{fields}[7]
    ${open_book} =  set variable  @{fields}[9]
    ${content_title} =  set variable  @{fields}[10]
    ${page_pos} =  set variable  @{fields}[15]
    @{blank_fields} =  create list  @{fields}[8]  @{fields}[11]  @{fields}[12]  @{fields}[13]  @{fields}[14]
    ...  @{fields}[16]  @{fields}[17]  @{fields}[18]  @{fields}[19]  @{fields}[20]  @{fields}[21]  @{fields}[22]

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

