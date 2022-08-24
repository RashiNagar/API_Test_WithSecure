*** Settings ***
Library         RequestsLibrary
Library         String



*** Variables ***

${BASE_URL_SignUpService}     http://127.0.0.1:8001/api/v1/signupsrv/
${BASE_URL_QuoteService}           http://127.0.0.1:8080/api/v1/quotesrv/
${BASE_URL_WeatherService}         http://127.0.0.1:8080/api/v1/weathersrv/



*** Keywords ***

Sign up a user

        [Arguments]     ${userName}     ${password}     ${status_code}      ${Details}
        Create Session  userLogin   ${BASE_URL_SignUpService}
        ${response}=    post on session  userLogin   url=/signup    params=name=${userName}&passwd=${password}
        status should be        ${status_code}
        ${output}=      convert to string   ${response.content}
        should contain      ${output}       ${Details}


Create a new User

        ${name}=            generate random string    8     [LETTERS][NUMBERS]
        ${password}=        generate random string      8     [LETTERS][NUMBERS]
        ${Details}=         convert to string       Please save it. This is visible only once. If you forget please regenerate token
        Sign up a user      ${name}       ${password}      200      ${Details}
        [Return]            ${name}


Get token of the user

        [Arguments]     ${username}
        Create Session  renewToken   ${BASE_URL_SignUpService}
        ${response}=    Patch on session    renewToken   url=/renew    params=name=${userName}
        status should be  200
        ${token}=    Get Substring	${response.content}   8   40
        [Return]        ${token}