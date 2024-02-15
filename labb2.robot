*** Settings ***
Documentation   boka bil
Library     SeleniumLibrary
Suite Setup     setup

*** Variables ***


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
${lasname}      Doe
${phonenumber}      0123456789
${usermail}     johndoe@email.boi
${pass}     abc123


