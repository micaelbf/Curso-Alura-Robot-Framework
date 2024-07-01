*** Settings ***
Resource        ../resources/main.robot
Test Setup      Dado que o usuário acesse o site organo
Test Teardown   Fechar o navegador


*** Test Cases ***
Verificar se os dado são preencidos no formulário e o card é criado no time corretamente.
    Dado que o usuário preencha os campos do formulário
    E clique no botão criar card
    Então o card deve estar visível no time correto


Verificar a criação de mais de um card 
    Dado que o usuário preencha os campos do formulário
    E clique no botão criar card
    Então deve ser criado 3 cards no time esperado

Verificar se é possivel criar cards em times separados se preenchermos os campos corretamente
    Dado que o usuário preencha os campos do formulário
    Então criar e identificar um card em cada time disponível


