*** Settings ***
Library           ../Libraries/ImageHandler.py

*** Test Cases ***
FOR Loop With Upper Bounds Range
    : FOR    ${number}    IN RANGE    5
    \    Log    ${number}

FOR Loop With Start and Finish Range
    : FOR    ${number}    IN RANGE    1    4
    \    Log    ${number}

FOR Loop With List
    @{LISTS} =    CREATE LIST    Item 1    Item 2    Item 3    Item 4
    : FOR    ${list}    IN    @{LISTS}
    \    Log    ${list}

Exit a FOR loop
    @{LISTS} =    CREATE LIST    Item 1    Item 2    Item 3    Item 4
    : FOR    ${list}    IN    @{LISTS}
    \    Log    ${list}
    \    Comment    RUN KEYWORD IF    '${list}' == 'Item 2'    EXIT FOR LOOP
    \    Exit For Loop If    '${list}'== 'Item 3'
    \    LOG    still in loop
    LOG    Out of loop now

Repeat a keyword many times
    REPEAT KEYWORD    5    Repeat Something
    REPEAT KEYWORD    3 times    Log    Repeat 3 times
    REPEAT KEYWORD    2 x    Log    Repeat 2 x
    REPEAT KEYWORD    2 s    Log    Repeat in 2 seconds
    #    REPEAT KEYWORD    2 m    Log    Repeat each 2 minutes

*** Keywords ***
Repeat Something
    LOG    Repeat Something is called
