*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

Testar se o acesso do usuário já cadastrado é efetuado com sucesso 
    Dado que o usuário clique em já tenho conta
    E insira usuário e senha corretamente e clique em entrar
    Então ele deve ser redirecionado para a página "https://adopet-challenge.vercel.app/pets"

Testar se o cadastro de um novo usuário e realizado com sucesso
    Dado que o usuário clique em Quero me cadastrar
    E preencha email, nome, senha e confirmar senha corretamente e clicar em cadastrar
    Então ele deve ser redirecionado para a página "https://adopet-challenge.vercel.app/pets"
    