*** Settings ***
Library  Collections

*** Variables ***
${distance_between_book_in_gird_view}   135
${distance_between_book_in_list_view}   45

*** Test Cases ***
Set scalar variable with conditions
    ${foo} =  set variable  true
    ${bar} =  run keyword if  '${foo}' == 'true'
    ...       set variable  this is bar
    should be equal  ${bar}  this is bar
    Log Many  ${foo}  ${bar}

GRID view mode_Set scalar variable inside "Run Keywords" keyword
    ${input_book_location} =  create list  ${22}   ${33}
    set global variable    ${IS_GRID_VIEW}  ${TRUE}

    ${new_location} =  Calculate new book's location from the location of input book's location  ${input_book_location}

    log   ${new_location}

    ${dictionary} =  create dictionary  book1=${input_book_location}    book2=${new_location}
    ${value_1} =  get from dictionary  ${dictionary}  book1
    ${value_2} =  get from dictionary  ${dictionary}  book2


    log  @{value_1}[0]
    log  @{value_2}[1]


LIST view mode_Set scalar variable inside "Run Keywords" keyword
    ${input_book_location} =  create list  ${22}   ${33}
    set global variable    ${IS_GRID_VIEW}  ${FALSE}
    Return FAIL
    ${new_location} =  Calculate new book's location from the location of input book's location  ${input_book_location}

    log   ${new_location}

    ${number} =  set variable  ${2}
    log to console  ${${number} + 1}


*** Keywords ***
Calculate new book's location from the location of input book's location
    [Arguments]  ${input_book_location}   ${is_in_grid_view_mode}=${IS_GRID_VIEW}

    ${new_x} =  set variable  ${EMPTY}
    ${new_y} =  set variable  ${EMPTY}
    ${new_book_location} =  create list

    run keyword if  ${is_in_grid_view_mode}
    ...  Run Keywords  append to list  ${new_book_location}   ${@{input_book_location}[0] + ${distance_between_book_in_gird_view}}
    ...  AND   append to list  ${new_book_location}   @{input_book_location}[1]
    ...  ELSE  Run Keywords   append to list  ${new_book_location}   @{input_book_location}[0]
    ...  AND   append to list  ${new_book_location}   ${@{input_book_location}[1] + ${distance_between_book_in_list_view}}

    [Return]  ${new_book_location}

Return FAIL
    return from keyword  stop keyword in middle
    fail   check failure

Pass Keywrod
    pass execution  pass
# robot -d Results -b debug.log variable_scalar.robot