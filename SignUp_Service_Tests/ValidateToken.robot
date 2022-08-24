*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***

Check the token

        [Arguments]     ${token}    ${is_valid}
        Create Session  valid_token   ${BASE_URL_SignUpService}
        ${response}=    Get on session    valid_token   url=/validate    params=token=${token}
        status should be    200
        ${output}=   convert to string   ${response.content}
        should be equal   ${output}     ${is_valid}


Verify if the token is valid

        ${name}=            Create a new User
        ${token}=           get token of the user      ${name}
        check the token     ${token}    true


Verify if token is invalid

        check the token     somerandominvalidtoken      false

