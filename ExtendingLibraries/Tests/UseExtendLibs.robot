*** Settings ***
Library  ../Libraries/MyLib.py
Library  ../Libraries/AnotherLib.py     

*** Test Cases ***
Verify MyLib.py
    print hello  Watarus

Verify AnotherLib.py
    print message  Watarus




# robot -d Results  -b debug.log Tests\UseExtendLibs.robot