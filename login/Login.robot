*** Settings ***
Resource    ../lib/lib.robot

Suite Setup    Open Web Startup
Suite Teardown    Close Browser


*** Variables ***
${investorEmail}   tiktoc.kannikar@gmail.com 



*** Test cases ***
Check Login Popup 
    Click link    btnLogin
    Should Show Startup Login Information 
    Should Show Investor Login Information
    
Login Investor with Invalid Password
    Input Text    investorEmail    ${investorEmail}
    Input Text    investorPassword    Tik11
    Click Button    btnLoginInvestor
    Wait Until Page Contains    invalid username of password

Login Investor
    Input Text    investorEmail    ${investorEmail}
    Input Text    investorPassword    tik
    Click Button    btnLoginInvestor
    Wait Until Page Contains    tiktoc.kannikar
    Click Element    linkLogout

Login Startup with Invalid Password
    Wait Until Page Contains    Login
    Click link    btnLogin
    Input Text    startupEmail    ${investorEmail}
    Input Text    startupPassword    ttt011
    Click Button    btnLoginStartup
    Wait Until Page Contains    invalid username or password

Login Startup
    Input Text    startupEmail    ${investorEmail}
    Input Text    startupPassword    tik11
    Click Button    btnLoginStartup
    Wait Until Page Contains    tiktoc.kannikar   

 

*** KeyWords ***
Should Show Startup Login Information
    Wait Until Page Contains    Login Startup 
    Page Should Contain    Login Startup
    Page Should Contain    E-mail
    Page Should Contain Textfield    startupEmail
    Page Should Contain    Password
    Page Should Contain Textfield    startupPassword
    Page Should Contain Element    btnLoginStartup

Should Show Investor Login Information
    Wait Until Page Contains    Login Investor
    Page Should Contain    Login Investor
    Page Should Contain    E-mail
    Page Should Contain Textfield    investorEmail
    Page Should Contain    Password
    Page Should Contain Textfield    investorPassword
    Page Should Contain Element    btnLoginInvestor




