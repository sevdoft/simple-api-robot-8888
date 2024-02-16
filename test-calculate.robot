*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    http://127.0.0.1:5000/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


*** Test Cases ***
Test Calculate Numbers 4 and 2

    ${resp}=     GET    http://127.0.0.1:5000/plus/4/2

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response
    Should Be Equal    ${json_resp}    ${6}

Test Calculate Numbers 0 and 0
    ${resp}=     GET    http://127.0.0.1:5000/plus/0/0

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable    ${resp.json()}

    # Verify the response
    Should Be Equal    ${json_resp}    ${0}

Test Calculate Negative Numbers -5 and -3
    ${resp}=     GET    http://127.0.0.1:5000/plus/-5/-3

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable    ${resp.json()}

    # Verify the response
    Should Be Equal    ${json_resp}    ${-8}

Test Calculate Decimal Numbers 3.5 and 2.5
    ${resp}=     GET    http://127.0.0.1:5000/plus/3.5/2.5

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable    ${resp.json()}

    # Verify the response
    Should Be Equal    ${json_resp}    ${6.0}

Test Calculate Large Numbers 1000000 and 500000
    ${resp}=     GET    http://127.0.0.1:5000/plus/1000000/500000

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable    ${resp.json()}

    # Verify the response
    Should Be Equal    ${json_resp}    ${1500000}
