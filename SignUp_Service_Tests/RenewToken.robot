*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***

Renew Token of a user

        [Arguments]         ${userName}         ${status_code}     ${Details}
        Create Session      renewToken          ${BASE_URL_SignUpService}
        ${response}=        patch on session    renewToken   url=/renew    params=name=${userName}      expected_status=${status_code}
        status should be    ${status_code}
        ${output}=          convert to string   ${response.content}
        should contain      ${output}           ${Details}


Verify Token is renewed with valid username

        ${Details}=         convert to string       Please save it. This is visible only once.
        ${name}=            Create a new User
        Renew Token of a user      ${name}          200         ${Details}


Verify token for the user that is not created

        ${Details}=         convert to string       User Not Found
        Renew Token of a user      UserNotCreated    404        ${Details}


Verify that token is not renewed for a duplicate user

        ${Details}=         convert to string          Please save it. This is visible only once. If you forget please regenerate token
        ${name}=            generate random string      8           [LETTERS][NUMBERS]
        Sign up a user             ${name}              Password       200               ${Details}
        Sign up a user             ${name}              Password       200               ${Details}
        ${Details}=         convert to string           Duplicate Records found
        Renew Token of a user      ${name}              409                              ${Details}


Verify token is not renewed for user with Invalid name

        # Requirment for Validation message for invalid input not clear hence using some random validation message
        ${Details}=          convert to string            Error: Invalid details
        Renew Token of a user        ${SPACE}             409     ${Details}





