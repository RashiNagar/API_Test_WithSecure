*** Settings ***
Library         RequestsLibrary
Resource        Weather.robot



*** Test Cases ***

TC_Get_weather_with_valid_token
    [Tags]              Weather
    [Documentation]     This test case verifies that weather is returned for the given token
    Verify that weather is returned if token is valid



TC_Weather_not_returned_with_invalid_token
    [Tags]              Weather
    [Documentation]     This test case verifies that weather is not returned for the given token
    Verify that weather is not returned if token in invalid


TC_Weather_not_Returned_with_invalid_input
    [Tags]               Weather
    [Documentation]     This test case verifies that weather is not returned for the given token
    Verify that weather is not returned if whitespace is entered


TC_Weather_not_returned_when_special_character_is_entered
    [Tags]               Weather
    [Documentation]     This test case verifies that weather is not returned for the given token
    Verify that weather is not returned if special character is entered