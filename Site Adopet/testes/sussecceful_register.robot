*** Settings ***
Resource        ../resources/main.robot
Resource        ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

Verificar se o cadastro de um novo usuário e realizado com sucesso
    Dado que o usuário clique em Quero me cadastrar
    E preencha email, nome, senha e confirmar senha corretamente e clicar em cadastrar
    Entao ele deve ser redirecionado para a página de pets


    
    
    
    