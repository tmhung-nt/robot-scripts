*** Settings ***
Library           XML

*** Variables ***
${XML_MENU_PATH}    inputs/xml/menu.xml
${EXPECTED_MENU_COUNT}    1
${EXPECTED_FOOD_COUNT}    5

*** Keywords ***
Should be one menu in the file
    # since we're passing the file name with no element, we get
    # a count of how many elements are in the file
    ${menu_count} =    Get Element Count    ${XML_MENU_PATH}
    Should Be Equal As Numbers    ${menu_count}    ${EXPECTED_MENU_COUNT}

Verify Menu Name
    ${root} =    Parse XML    ${XML_MENU_PATH}
    Should Be Equal    ${root.tag}    breakfast_menu

Verify Food Count
    # This time, we pass the element name we want to count along with the file name
    ${food_count} =    Get Element Count    ${XML_MENU_PATH}    food
    Should Be Equal As Numbers    ${food_count}    ${EXPECTED_FOOD_COUNT}

Verify Food Name By Index
    [Arguments]    ${food_index}    ${food_name}
    # I would have thought I need to pass breakfast_menu/food[1]/name
    # but that is not the case. Only pass the name of the desired element
#    ${food_index} =  set variable  food[${food_index}]/name
    ${first_food_name} =    Get Element    ${XML_MENU_PATH}    food[${food_index}]/name
    Should Be Equal As Strings    ${first_food_name.text}    ${food_name}

Verify Food Price By Index
    [Arguments]    ${food_index}    ${food_price}
#    ${food_index} =  set variable  food[${food_index}]/price  #
    ${first_food_price} =    Get Element    ${XML_MENU_PATH}    food[${food_index}]/price
    Should Be Equal As Strings    ${first_food_price.text}    ${food_price}

Verify Food Calories By Index
    [Arguments]    ${food_index}    ${food_calories}
    ${first_food_calories} =    Get Element    ${XML_MENU_PATH}    food[${food_index}]/calories
    Should Be Equal As Strings    ${first_food_calories.text}    ${food_calories}

Add New Food
    ${root} =    Parse XML    ${XML_MENU_PATH}
    Add Element    ${root}    <food></food>
    Add Element    ${root}    <name>Grilled Cheese Sandwich</name>    xpath=food[6]
    Add Element    ${root}    <price>$2.95</price>    xpath=food[6]
    Add Element    ${root}    <description>Yummy melted cheese on grilled sourdough slices</description>    xpath=food[6]
    Add Element    ${root}    <calories>300</calories>    xpath=food[6]
    Save XML    ${root}    ${XML_MENU_PATH}

Verify New Food Exists
    Element Should Exist    ${XML_MENU_PATH}    food[6]
