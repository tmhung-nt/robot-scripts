*** Settings ***
Documentation     These are some XML tests
Resource          ../Resources/XML/Breakfast_Menu.robot    # Many ways to run: | # pybot -d results/xml tests/XML_Tests.robot | # pybot -d results/xml -i XML tests | # pybot -d results tests

*** Variables ***
${food_index}     1
${food_name}      Belgian Waffles
${food_price}     $5.95
${food_caloriges}    650

*** Test Cases ***
Verify Menu Count
    [Tags]    XML
    Breakfast_Menu.Should be one menu in the file

Verify Root
    [Tags]    XML
    Breakfast_Menu.Verify Menu Name

Verify Food Count
    [Tags]    XML
    Breakfast_Menu.Verify Food Count

Verify Food By Index
    [Tags]    XML
    Breakfast_Menu.Verify Food Name By Index    ${food_index}    ${food_name}
    Breakfast_Menu.Verify Food Price By Index    ${food_index}    ${food_price}
    Breakfast_Menu.Verify Food Calories By Index    ${food_index}    ${food_caloriges}

Add a Food
    [Tags]    XML
    Breakfast_Menu.Add New Food

Verify New Food Was Added
    [Tags]    XML
    Breakfast_Menu.Verify New Food Exists
