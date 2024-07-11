*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***

CT001.001-Verificar se o acesso de um usuário já cadastrado é efetuado com sucesso 
    Dado que o usuário clique em "Já tenho conta"
    Quando inserir um usuário válido
    E clicar em "Entrar"
    Então ele deve ser redirecionado para a página de adoção de pets

CT002.001-Verificar se o cadastrado de um usuário é relizado com sucesso 
    Dado que o usuário clique em "Quero me cadastrar"
    Quando digitar os os campos email, nome, senha e confirmar sua senha
    E clicar no botão "Cadastrar"
    Então o usuário deve receber a menssagem de cadastro realizado com sucesso e ser redirecionado para a página de adoção de pets

CT003.001-Verificar icone home na tela inicial
    Dado que o usuário esteja na tela home do site Adopet
    Quando o usuário clicar no icone home
    Então deve ser redirecionado para a página de login

CT003.002-Verificar icone home na tela inicial
    Dado que o usuário esteja na tela home do site Adopet
    Quando o usuário clicar no icone menssagem
    Então deve ser redirecionado para a página de login
