*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***


Get Quote

        [Arguments]         ${token}            ${status_code}
        Create Session      quoteSession        ${BASE_URL_QuoteService}
        ${response}=        GET On Session      quoteSession              url=/quote    params=token=${token}      expected_status=${status_code}
        status should be    ${status_code}
        log to console      ${response.content}


Verify that random quote is generated if token is valid

        ${username}=        Create a new User
        ${token}=           Get token of the user       ${username}
        Get quote           ${token}        200


Verify that random quote is not generated if token in invalid

        Get Quote           somerandomtoken     401


