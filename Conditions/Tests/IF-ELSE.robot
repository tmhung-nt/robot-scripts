

*** Variables ***
${VALUE} =  100

*** Keywords ***
Keyword 1
    Log  Keyword 1

Keyword 2
    Log  Keyword 2

Keyword 3
    Log  Keyword 3


*** Test Cases ***
Testing a true IF statement
    run keyword if  ${VALUE} > 50  Keyword 1

Testing a false IF statement
    run keyword if  ${value} > 200  keyword 2

Testing an IF/ELSE statement
    run keyword if  ${VALUE} > 200  Keyword 1  else  Keyword 2

Testing a IF/ELSE IF/ELSE statement
    run keyword if  ${value} > 200  keyword 1
    ...  else if   ${VALUE} == 50   keyword 2
    ...  else  Keyword 3