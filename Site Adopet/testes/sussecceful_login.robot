*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

Verificar se o acesso do usuário já cadastrado é efetuado com sucesso 
    Dado que o usuário clique em já tenho conta
    E insira usuário e senha corretamente e clique em entrar
    Entao ele deve ser redirecionado para a página de pets
    