*** Settings ***
Library    SeleniumLibrary
Resource   ../main.robot

*** Keywords ***
Dado que o usuário acesse o site organo
    Open Browser    url=http://localhost:3000   browser=Chrome

Fechar o navegador
    Close Browser