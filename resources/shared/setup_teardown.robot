*** Settings ***
Resource    ../main.robot

*** Variables ***
${BROWSER}    chrome 

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fecha o navegador
    Close Browser