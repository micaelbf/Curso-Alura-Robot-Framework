*** Settings ***
Resource  ../resources/pages/login.robot
Resource  ../resources/main.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***
CT001.001-Verificar se o acesso de um usuário já cadastrado é efetuado com sucesso 
    Dado que o usuário clique em "Já tenho conta"
    Quando inserir um usuário e senha válidos
    E clicar em "Entrar"
    Então ele deve ser redirecionado para a página de adoção de pets