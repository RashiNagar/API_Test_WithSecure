*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***


Check user information

        [Arguments]         ${token}        ${name}        ${response_code}
        Create Session      GetUserInfo     ${BASE_URL_SignUpService}
        ${response}=        GET On Session  GetUserInfo     url=/user       params=token=${token}       expected_status=${response_code}
        status should be    ${response_code}
        ${output}=   convert to string   ${response.content}
        should be equal      ${output}     "${name}"


Verify user information with valid token

        ${name}=        Create a new user
        ${token}=      get token of the user      ${name}
        check user information      ${token}      ${name}       200


Verify user information with invalid token

        check user information      somerandomtoken123      Invalid Token       401


