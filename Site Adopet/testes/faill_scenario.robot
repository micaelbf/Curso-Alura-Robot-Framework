*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

Verificar quando o usuário não digitar email e senha na tela de login
    Dado que o usuário clique em já tenho conta
    E clique em entrar sem digitar as credenciais de login
    Então deve receber as menssagens de erro para inserir email e senha

Verificar quando o usuário não preencher o formulário na tela de cadastro
    Dado que o usuário clique em Quero me cadastrar
    E clique em cadastrar sem preencher o formulário
    Então deve receber as menssagens de erro de compos obrigatórios 
    
Verificar quando o usuário digitar email e senha incorretos na tela de login
    Dado que o usuário clique em já tenho conta
    E digite o e-mail incorretamente e a senha com menos de seis caracteres
    Então ele deve receber a menssagens de erro "email inválido" e "Mínimo de 6 caracteres" 

