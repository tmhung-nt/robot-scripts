*** Settings ***
Library           OperatingSystem

*** Test Cases ***
Test case 01
    [Documentation]    Folder related actions
    OperatingSystem.Create Directory    Outputs
    OperatingSystem.Should Exist    Outputs
    Empty Directory    Outputs
    ${directory_path}    Join Path    Outputs    Folder 1
    OperatingSystem.Create Directory    ${directory_path}
    OperatingSystem.Should Exist    ${directory_path}
    Create File    ${directory_path}/text_1.txt    This is content of text_1.txt
    Should Exist    ${directory_path}/text_1.txt
    Empty Directory    ${directory_path}

Test case 02
    [Documentation]    File related actions
    ${file_path}    Join Path    Outputs    Folder 1    text_2.txt
    Create File    ${file_path}    This is the content of text_2.txt
    Should Exist    ${file_path}
    ${directory_path}    Join Path    Outputs    Folder 2
    Create Directory    ${directory_path}
    Should Exist    ${directory_path}
    Move File    ${file_path}    ${directory_path}
    Should Exist    ${directory_path}/text_2.txt
