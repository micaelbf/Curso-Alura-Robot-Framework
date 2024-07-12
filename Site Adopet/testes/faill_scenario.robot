*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

CT001.001-Verificar menssagens de erro quando o usuário não digitar email e senha na tela de login
    Dado que o usuário estejá na página de login
    Quando clicar em entrar sem digitar as credenciais de login
    Eentão deve receber as menssagens de erro "Insira seu email" e "Insira sua Senha"
