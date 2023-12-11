# before running this suite.

*** Settings ***
Resource                   ../calResource/cal_Common.robot
Suite Setup                Setup Browser
Suite Teardown             End suite


*** Test Cases ***
Calendar Format Xpath
    [Tags]                 commitment
    Appstate               Home
    ClickText              Do not consent
    ClickCell              //table[@class='ui-datepicker-calendar']//a[text()=10]
    

    

   
