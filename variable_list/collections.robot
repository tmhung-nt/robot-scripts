*** Settings ***
Library  Collections
Library  ./Libraries/CollectionsHandler.py


*** Keywords ***
Check Whether List Is Sorted Or not
    [Documentation]  Check Whether List Is Sorted Or not, return TRUE if yes and vice versa
    [Arguments]  ${list}
    ${isSorted} =  is list descreased  ${list}
    run keyword unless  ${isSorted}  FAIL  Input list is not sorted yet

*** Test Cases ***
Check List doesnot contain duplicate value
    @{list} =  create list  1  2  3  4  5
    list should not contain duplicates  ${list}

    append to list  ${list}  4
    list should not contain duplicates  ${list}

Check List is sorted
    @{list} =  create list  1  2  3  4  5
    Check Whether List Is Sorted Or not  ${list}

    append to list  ${list}  4
    Check Whether List Is Sorted Or not  ${list}

Check List is in order
    @{list} =  create list  780   760   740   720   700   680   660   640   620   600   580   560   540   520   500   480   460   440   420   400   380   360   340   320   300   280   260   240   220   200   180   160   140   120   100   80   60   40   20
    Check Whether List Is Sorted Or not  ${list}

# robot -d Results  collections.robot
