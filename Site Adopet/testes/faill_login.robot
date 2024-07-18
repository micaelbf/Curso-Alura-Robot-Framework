*** Settings ***

Resource          ../resources/pages/login.robot
Resource          ../resources/main.robot
Test Setup        Acessar a URL
Test Teardown     Fechar browser

*** Test Cases ***

CT001.001-Verificar menssagens de erro quando o usuário não digitar "email" e "senha" na tela de "login"
    Dado que o usuário clique em "Já tenho conta"
    Quando clicar em entrar sem digitar as credenciais de login
    Então deve receber as menssagens de erro "Insira seu email" e "Insira sua Senha"

