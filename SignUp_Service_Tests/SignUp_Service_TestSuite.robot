*** Settings ***
Resource        SignupNewUser.robot
Resource        RenewToken.robot
Resource        ValidateToken.robot
Resource        UserInfo.robot



*** Test Cases ***
TC_Signup_with_Valid_user_details

    [Tags]              Signup
    [Documentation]     This test case verifies that signup is done successfully with valid user details
    Verify signup with Valid user details


TC_Singup_with_Invalid_username

    [Tags]              Signup
    [Documentation]     This test case verifies that signup is not done when user enters with invalid user name but valid password
    Verify Signup with Invalid Username


TC_Signup_with_valid_username_and_Invalid_password

    [Tags]              Signup
    [Documentation]     This test case verifies that signup is not done when user enters with valid user name and invalid password
    Verify Signup with valid username and Invalid password


TC_Signup_with_invalid_username_and_invalid_password

    [Tags]              Signup
    [Documentation]     This test case verifies that signup is not done when user enters with invalid user name and password
    Verify Signup with invalid username and invalid password


TC_Signup_with_username_containing_special_characters

    [Tags]              Signup
    [Documentation]     This test case verifies that signup is not done when user enters with special characeters in user name field
    Verify Signup with username containing special characters


TC_Renew_Token_with_valid_user_details

    [Tags]              TokenRenew
    [Documentation]     This test case verifies token is renewed when user enters valid username
    Verify Token is renewed with valid username


TC_Renew_token_for_user_not_available

     [Tags]              TokenRenew
     [Documentation]     This test case verifies token is not renewed when user enters user name that is not yet created.
     Verify token for the user that is not created


TC_Renew_token_for_duplicate_user

     [Tags]              TokenRenew
     [Documentation]     This test case verifies token is not renewed when user enters duplicate username
     Verify that token is not renewed for a duplicate user


TC_Renew_token_for invalid_user_details

     [Tags]              TokenRenew
     [Documentation]     This test case verifies token is not renewed when user enters invalid username
     Verify token is not renewed for user with Invalid name


TC_Check_for_valid_token

     [Tags]              ValidateToken
     [Documentation]     This test case verifies that token entered is valid
     Verify if the token is valid

TC_Check_for_invalid_token

     [Tags]              ValidateToken
     [Documentation]     This test case verifies that token entered is not valid
     Verify if token is invalid

TC_Check_userInfo_for_valid_token

    [Tags]              UserInfo
    [Documentation]     This test case verifies that correct name is returned for the given valid token
    Verify user information with valid token


TC_Check_userInfo_for_invalid_token

     [Tags]              UserInfo
     [Documentation]     This test case verifies that name is not returned for the given invalid token
     Verify user information with invalid token














