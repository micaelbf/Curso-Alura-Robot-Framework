*** Settings ***

Resource          ../resources/pages/register.robot
Resource          ../resources/main.robot
Test Setup        Acessar a URL
Test Teardown     Fechar browser

*** Test Cases ***

CT002.001-Verificar menssagens de erro quando o usuário não preencher os campos do formulário e clicar em cadastrar 
    Dado que o usuário clique em "Quero me cadastrar"
    Quando clicar em "Cadastrar" sem preencher os campos do formulário
    Então deve receber as menssagens de erro "email obrigatório", "nome é obrigatório", "senha é obrigatória" e "confirmação de senha obrigatória"

CT002.002-Verificar menssagens de erro quando os dados do formulário forem preenchidos incorretamente
    Dado que o usuário clique em "Quero me cadastrar"
    Quando digitar os campos "email", "nome", "senha" e "confirmar sua senha" incorretamente
    E clicar no botão "Cadastrar" 
    Então deve ser apresentado as mensagen de erro "email inválido", "mínimo de 3 caracteres", "senha deve ter no mínimo 6 caracteres", "as senhas não combinam"

CT002.003-Verificar quando o usuário inserir numero no campo nome
    Dado que o usuário clique em "Quero me cadastrar"
    Quando ele inserir um numero no campo "nome"
    Então deve ser apresentado a menssagem de "caracter inválido"
