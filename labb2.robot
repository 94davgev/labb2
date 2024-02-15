*** Settings ***
Documentation   boka bil
Library     SeleniumLibrary
Suite Setup     setup

*** Variables ***
${url}      http://rental22.infotiv.net/
${title}     //*[@id="title"]
${e-mail field}     //*[@id="email"]
${pass field}       //*[@id="password"]
${login}    //*[@id="login"]
${firstname}    John
${lastname}      Doe
${phonenumber}      0123456789
${usermail}     johndoe@email.boi
${pass}     abc123
${start date}      2024-02-18
${end date}        2024-02-25
${continue}        //*[@id="continue"]



*** Test Cases ***
User logs into website
    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Text    ${pass field}    ${pass}
    Click Element    ${login}

User Books date for trip
    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element   //*[@id="start"]
    Input Text    //*[@id="start"]    ${start date}
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}




*** Keywords ***
setup
    Open Browser    browser=Chrome
    Go To    ${url}
    Wait Until Page Contains Element    ${title}
    Set Selenium Speed    0.5

