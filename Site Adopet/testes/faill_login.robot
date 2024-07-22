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

CT001.002-Verificar menssagens de erro quando o usuário digitar um email inválido sem ""@"" e a senha com menos de seis caracteres
    Dado que o usuário clique em "Já tenho conta"
    Quando digitar o e-mail inválido sem "@"                                                                                                                                                                                                                                            
    E a senha com menos de seis caracteres
    E clicar em "entrar"
    Então ele deve receber a menssagens de erro "Email inválido" e "Mínimo de 6 caracteres"