# before running this suite.

*** Settings ***
Resource               ../calResource/cal_Common.robot
Suite Setup            Setup Browser
Suite Teardown         End suite


*** Test Cases ***
Calendar Format Xpath
    [Tags]             commitment
    Appstate           Home
    ClickText          Do not consent
    ClickText          //table[@id\='datepickers']//input[@id\='first_date_picker']
    ClickText          //table[@class\='ui-datepicker-calendar']//a[text()\=10]
    Sleep              10s
    ${selectedMon}=    GetInputValue                    //input[@id\='first_date_picker']
    Sleep              10s
    Log                ${selectedMon}
    Sleep              10s




