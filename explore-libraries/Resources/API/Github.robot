*** Settings ***
Library           RequestsLibrary
Library           Selenium2Library    # only used to display something we get back from API test
#
*** Variables ***
${gitHub_User} =  watarus-nt
*** Keywords ***
Check Github Username
    # Create the Session
    Create Session    my_github_session    https://api.github.com
    # Make the call (and capture the response in a variable)
    ${response} =    Get Request    my_github_session    users/${gitHub_User}
    # Check the Response status
    Should Be Equal As Strings    ${response.status_code}    200
    # Check the Response body
    ${json} =    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json['login']}    ${gitHub_User}
    Log    ${json}

Display Emoji
    # Create the session
    Create Session    my_github_session    https://api.github.com
    # Make the call (and capture the response in a variable)
    ${response} =    Get Request    my_github_session    emojis
    # Check the Response status
    Should Be Equal As Strings    ${response.status_code}    200
    # Check the Response body
    ${json} =    Set Variable    ${response.json()}
    ${emoji_url} =    Set Variable    ${json['aerial_tramway']}
    Open Browser    ${emoji_url}    chrome
    Close Browser
