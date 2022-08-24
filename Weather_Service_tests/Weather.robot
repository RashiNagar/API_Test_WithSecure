*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***


Get Weather

        [Arguments]         ${token}             ${status_code}
        Create Session      weatherSession       ${BASE_URL_WeatherService}
        ${response}=        GET On Session       weatherSession       url=/weather    params=token=${token}      expected_status=${status_code}
        status should be    ${status_code}
        log to console      ${response.content}


Verify that weather is returned if token is valid

        ${username}=        Create a new User
        ${token}=           Get token of the user       ${username}
        Get Weather         ${token}                    200


Verify that weather is not returned if token in invalid

        Get Weather         somerandomtoken             401


Verify that weather is not returned if special character is entered

        Get Weather         @£$                         401

Verify that weather is not returned if whitespace is entered

        Get Weather         " "                         401




