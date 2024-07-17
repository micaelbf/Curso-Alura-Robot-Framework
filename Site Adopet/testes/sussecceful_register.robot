*** Settings ***
Resource         ../resources/main.robot
Resource         ../resources/pages/register.robot
Test Setup       Acessar a URL
Test Teardown    Fechar browser

*** Test Cases ***
CT002.001-Verificar se o cadastrado de um usuário é relizado com sucesso 
    Dado que o usuário clique em "Quero me cadastrar"
    Quando digitar os os campos email, nome, senha e confirmar sua senha
    E clicar no botão "Cadastrar"
    Então o usuário deve receber a menssagem de cadastro realizado com sucesso e ser redirecionado para a página de adoção de pets
