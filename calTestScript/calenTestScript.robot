# before running this suite.

*** Settings ***
Resource                ../calResource/cal_Common.robot
Library                 DateTime
Library                 String
Library                 SeleniumLibrary
Suite Setup             Setup Browser
Suite Teardown          End suite

*** Variables ***
${for30Day}=            18
${for31Day}=            31


*** Test Cases ***
Current Month display Calendar Format Xpath
    [Tags]              commitment
    [Documentation]     Current Month calendar display month. In this calendar if current month starts with Tuesday, previous month sunday and monday cells will display emtpy, like that current months ends with friday, next month values i.e saturday will display empth.
    Appstate            Home
    ClickText           Do not consent
    Log                 ${for30Day}
    ClickText           //table[@id\='datepickers']//input[@id\='first_date_picker']                        # click datepicker text box and populate the calender
    ClickText           //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']                 # select the date from the table
    Sleep               3s
    ${selectedMon}=     GetInputValue               //input[@id\='first_date_picker']                       # After selected the date , fetch the selected date from input field
    Sleep               3s
    Log                 'First Calender Value : ' ${selectedMon}
    #Sleep               3s

Previews Current Next Months display calendar format Xpath
    [Tags]              PrecurNextMonths
    [Documentation]     Current Month calendar display month. In this calendar if current month starts with Tuesday, previous month sunday and monday cells will display emtpy, like that current months ends with friday, next month values i.e saturday will display empth.
    #ClickText           Do not consent
    ClickText           //table[@id\='datepickers']//input[@id\='second_date_picker']
    ClickText           //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,' ui-datepicker-other-month '))]/a[text()\='${for31Day}']
    #Sleep               3s
    ${selecteddate}=    GetInputValue               //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,' ui-datepicker-other-month '))]/a[text()\='${for31Day}']
    Sleep               3s
    Log                 'Second Calender Value : ' ${selecteddate}
    Sleep               3s

