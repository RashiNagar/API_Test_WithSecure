*** Settings ***
Library         RequestsLibrary
Resource        ../Resources/resource.robot



*** Keywords ***

Verify signup with Valid user details

        ${name}=        generate random string      8     [LETTERS][NUMBERS]
        ${password}=    generate random string      8     [LETTERS][NUMBERS]
        ${Details}=     convert to string           Please save it. This is visible only once. If you forget please regenerate token
        Sign up a user      ${name}                 ${password}         200         ${Details}


Verify Signup with Invalid Username

        ${password}=    generate random string      8     [LETTERS][NUMBERS]
        # Requirement for Validation message for invalid input not clear hence using some random validation message
        ${Details}=      convert to string          Invalid details
        Sign up a user          .                   ${password}         422         ${Details}


Verify Signup with valid username and Invalid password

        ${name}=        generate random string      8     [LETTERS][NUMBERS]
        # Requirement for Validation message for invalid input not clear hence using some random validation message
        ${Details}=     convert to string           Invalid details
        Sign up a user      ${name}                 ${SPACE}            422        ${Details}


Verify Signup with invalid username and invalid password

       # Requirement for Validation message for invalid input not clear hence using some random validation message
       ${Details}=     convert to string       Invalid details
       Sign up a user       .                       ${SPACE}            422        ${Details}

Verify Signup with username containing special characters

        ${password}=    generate random string      8     [LETTERS][NUMBERS]
        # Requirement for Validation message for invalid input not clear hence using some random validation message
        ${Details}=     convert to string       Invalid details
        Sign up a user      %40%24                  ${password}          422        ${Details}




