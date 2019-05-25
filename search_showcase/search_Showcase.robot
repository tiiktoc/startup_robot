*** Settings ***
Resource    ../lib/lib.robot

Suite Setup    Open Startup

Suite Teardown    Close Browser

*** Variables ***


*** Test cases ***
Search by KeyWords
    Input Text    searchByKeyword    Tom
    Page Should Contain    Tom

Search by KeyWords invalid
    Input Text    searchByKeyword    xx
    Page Should Not Contain    xx

*** KeyWords ***


