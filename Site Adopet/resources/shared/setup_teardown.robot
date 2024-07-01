*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Acessar a URL
    Open Browser    url=https://adopet-challenge.vercel.app/  browser=Chrome

Fechar browser
    Close Browser