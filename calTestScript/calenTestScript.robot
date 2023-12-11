# before running this suite.

*** Settings ***
Resource                   ../calResource/cal_Common.robot
Suite Setup                Setup Browser
Suite Teardown             End suite


*** Test Cases ***
Calendar Format Xpath
    [Tags]                 commitment
    Appstate               Home
    
    # text() --> .
    ${ltexsho}=             GetText                     //h1[.\='Register']                    # Actually syntax is : //h1[.\='Register']. Using Shortcut : //h1[.\='Register'] we can use dot instead of text to find text in the website
    ${ltexcont}=            GetText                     //a[contains(.,'account')]             # Actually : //a[contains(text(),'account')]. ussing shortcut : //a[contains(.,'account')]  we can use dot instead of text to find text in the website
    ${lchildshtcut}=        GetText                     //div[@class\='container']/h1          # Actual shortcut for child is "/", //div[@class='container']/child::h1. We can write using shortcut is //div[@class='container']/h1
    ${lparentShcut}=        GetText                     //h1[.\='Register']/..                 # Actual : //h1[.='Register']/parent , using shortcut : //h1[.='Register']/..
    ${ldescshcut}=          GetText                     //table[@id\='contactList']//td       # Actual : //table[@id='contactList']/descendant::td , Using Shortcut : //table[@id='contactList']//td
    
    Log                    ${ltexsho}
    Log                    ${ltexcont}
    Log                    ${lchildshtcut}
    Log                    ${lparentShcut}
    Log                    ${ldescshcut}

   
