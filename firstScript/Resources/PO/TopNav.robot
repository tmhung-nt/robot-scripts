*** Settings ***
Library  Selenium2Library

*** Keywords ***
Enter Search Product
    input text    id=twotabsearchtextbox    Ferrari 458 Speciale A Remote Control

Submit Search Form
    click element  xpath=//input[@value='Go']
    wait until page contains    Ferrari 458 Speciale A Remote Control
    wait until element contains   id=s-result-count  errari 458


