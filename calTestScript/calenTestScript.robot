# before running this suite.

*** Settings ***
Resource                        ../calResource/cal_Common.robot
Library                         DateTime
Library                         String
Library                         QWeb
Library                         QForce
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Variables ***
${for30Day}=                    16
${for31Day}=                    20
${setMonth}=                    January
${DropMonth}=                   Apr
${DropYear}=                    2015


*** Test Cases ***
Current Month display Calendar Format Xpath
    [Tags]                      commitment
    [Documentation]             Current Month calendar display month. In this calendar if current month starts with Tuesday, previous month sunday and monday cells will display emtpy, like that current months ends with friday, next month values i.e saturday will display empth.
    Appstate                    Home
    ClickText                   Do not consent
    Log                         ${for30Day}
    ClickText                   //table[@id\='datepickers']//input[@id\='first_date_picker']                        # click datepicker text box and populate the calender
    ClickText                   //table[@class\='ui-datepicker-calendar']//a[text()\='${for30Day}']                 # select the date from the table
    Sleep                       3s
    ${selectedMon}=             GetInputValue               //input[@id\='first_date_picker']                       # After selected the date , fetch the selected date from input field
    Sleep                       3s
    Log                         'Only Enable Calender Value : ' ${selectedMon}
    #Sleep                      3s

Previews Current Next Months display calendar format Xpath
    [Tags]                      PrecurNextMonths
    [Documentation]             Current Month calendar display month. In this calendar if current month starts with Tuesday, previous month sunday and monday cells will display emtpy, like that current months ends with friday, next month values i.e saturday will display empth.
    #ClickText                  Do not consent
    Log                         ${for31Day}
    ClickText                   //table[@id\='datepickers']//input[@id\='second_date_picker']
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,' ui-datepicker-other-month '))]//a[text()\='${for31Day}']
    #Sleep                      3s
    ${selecteddate}=            GetInputValue               //input[@id\='second_date_picker']
    #Sleep                      3s
    Log                         'Filter Enable Calender Value : ' ${selecteddate}
    Sleep                       3s
Next Date Selection and display calender format Xpath
    [Tags]                      PrecurNextMonths
    [Documentation]             Get the months and year using Next and Previous Buttons
    Appstate                    Home
    ClickText                   //table[@id\='datepickers']//input[@id\='second_date_picker']
    ClickText                   //a[@class\='ui-datepicker-next ui-corner-all']
    Sleep                       3s
    #ClickText                  //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,'ui-datepicker-other-month'))]//a[text()\='${for31Day}'] # //div[@class\='ui-datepicker-title']//span[text()\='${setMonth}']
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,'ui-datepicker-other-month'))]//a[text()\='${for31Day}']
    Sleep                       5s
    ${getNextmonth}=            GetInputValue               //input[@id\='second_date_picker']
    Log                         'Get Next Mont : ' ${getNextmonth}
    Sleep                       3s
Previous Date Selection and display calender format Xpath
    [Tags]                      PrecurNextMonths
    [Documentation]             Get the months and year using Next and Previous Buttons
    Appstate                    Home
    ClickText                   //table[@id\='datepickers']//input[@id\='second_date_picker']
    ClickText                   //a[@class\='ui-datepicker-prev ui-corner-all']
    Sleep                       3s
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,'ui-datepicker-other-month'))]//a[text()\='${for30Day}']
    Sleep                       5s
    ${getpreMonth}=             GetInputValue               //input[@id\='second_date_picker']
    Log                         'Get Prevoius Mont : ' ${getpreMonth}
    Sleep                       3s

SetMonth using month and year dropdown selection calendar
    [Tags]                      setmonyeardropdown
    [Documentation]             Set the month and Year in the drop down and select the date from calendar
    ClickText                   //table[@id\='datepickers']//input[@id\='third_date_picker']
    DropDown                    //select[@class\='ui-datepicker-month']                 ${DropMonth}
    DropDown                    //select[@class\='ui-datepicker-year']                  ${DropYear}
    ClickText                   //table[@class\='ui-datepicker-calendar']//a[text()\='${for31Day}']
    Sleep                       3s
    ${setdrdrownval}=           GetInputValue               //input[@id\='third_date_picker']
    Log                         'Set DropDown values and fetch : ' ${setdrdrownval}
    Sleep                       3s
Set Month and Year in the dropdown and select only enable dates in the calendar
    [Tags]                      Setmonyear_enabledates_only
    [Documentation]             Set Month and Year in the dropdown and set to allow select only enable dates in the calendar
    ClickText                   //table[@id\='datepickers']//input[@id\='fourth_date_picker']
    DropDown                    //select[@class\='ui-datepicker-month']                 Jun
    DropDown                    //select[@class\='ui-datepicker-year']                  ${DropYear}
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class ,' ui-datepicker-other-month '))]//a[text()\='5']
    Sleep                       3s
    ${aftdrdownset_getenable}=                              GetInputValue               //input[@id\='fourth_date_picker']
    Log                         'Fourth Text Input : ' ${aftdrdownset_getenable}
    Sleep                       3s

Current Day plus ten days enable calendar format
    [Tags]                      CurDayplusten
    [Documentation]             Select a day from current day plus ten days enable calendar format
    ClickText                   //table[@id\='datepickers']//input[@id\='fifth_date_picker']
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,'ui-datepicker-unselectable ui-state-disabled'))]//a[text()\='15']
    Sleep                       3s
    ${curplusten}=              GetInputValue               //input[@id\='fifth_date_picker']
    Log                         'fifth Text Input : '${curplusten}
    Sleep                       3s

Separate calendar with previousnext month calendar format
    [Tags]                      setmonyeardropdown
    [Documentation]             Separate calendar with previousnext month selection calendar format, selected date will display in text box
    ClickText                   //img[@class\='ui-datepicker-trigger']
    ${getcalheader}=            GetText                     //div[@class='ui-datepicker-title']
    Log                        'Sixth Text Box calendar title : ' ${getcalheader}
    ClickText                   //table[@class\='ui-datepicker-calendar']//td[not(contains(@class,'ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled'))]//a[text()\='${for30Day}']
    ${separatecale}=            GetInputValue               //input[@id\='sixth_date_picker']
    Log                         'Sixth Text Box , Select date out of text calender : ' ${separatecale}
    Sleep                       10s
