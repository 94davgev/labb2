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



${car}      //*[@id="bookModelSpass5"]
${card no.}     1234567891234567
${card day}     0
${card month}   7
${cvc}          789
${confirm}      //*[@id="confirm"]
${mypage}       //*[@id="mypage"]


*** Test Cases ***

User books car
    [Documentation]     User chooses car
    [Tags]      Car
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    ${car}

User enters info
    [Documentation]     User enters personal info
    [Tags]      info
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    ${firstname} ${lastname}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[1]     ${card day}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[2]     ${card month}
    Input Text    //*[@id="cvc"]    ${cvc}
    Click Element    ${confirm}

User confirms booking
    [Documentation]     confirm booking
    [Tags]              booking
    Wait Until Page Contains Element    //*[@id="confirmMessage"]/label
    Click Element    ${mypage}


*** Keywords ***
setup
    Open Browser    browser=Chrome
    Go To    ${url}
    Wait Until Page Contains Element    ${title}
    Set Selenium Speed    0.5


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


