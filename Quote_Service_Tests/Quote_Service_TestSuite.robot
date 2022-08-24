*** Settings ***
Resource        Quote.robot



*** Test Cases ***

TC_Get_a_quote_with_valid_token
    [Tags]              Quote
    [Documentation]     This test case verifies that quote is generated for the given token
    Verify that random quote is generated if token is valid



TC_Quote_not_returned_with_invalid_token
    [Tags]              Quote
    [Documentation]     This test case verifies that quote is not generated for the given token
    Verify that random quote is not generated if token in invalid