*** Settings ***
Resource         ../resources/main.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser


*** Variables ***

*** Test Cases ***

Verificar se o acesso do usuário já cadastrado é efetuado com sucesso 
    Dado que o usuário clique em já tenho conta
    E insira usuário e senha corretamente
    Então ele deve ser redirecionado para a página home

*** Keywords ***
Dado que o usuário clique em já tenho conta
    Click Button    class:link-button
E insira usuário e senha corretamente
    Input Text        id:email       ana@email.com
    Input Password    id:password    Senha123
Então ele deve ser redirecionado para a página home
    

