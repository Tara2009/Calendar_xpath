# before running this suite.

*** Settings ***
Resource               ../calResource/cal_Common.robot
Library                DateTime
Library                String
Library                SeleniumLibrary
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
${Day}= 20


*** Test Cases ***
Calendar Format Xpath
    [Tags]             commitment
    Appstate           Home
    ClickText          Do not consent
    ClickText          //table[@id\='datepickers']//input[@id\='first_date_picker']                        # click datepicker text box and populate the calender
    ClickText          //table[@class\='ui-datepicker-calendar']//a[text()\=+'${Day'+}]                        # select the date from the table
    Sleep              10s
    ${selectedMon}=    GetInputValue               //input[@id\='first_date_picker']                       # After selected the date , fetch the selected date from input field
    Sleep              10s
    Log                ${selectedMon}
    Sleep              10s




