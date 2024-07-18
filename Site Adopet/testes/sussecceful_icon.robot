*** Settings ***
Resource          ../resources/pages/home.robot
Resource          ../resources/main.robot
Test Setup        Acessar a URL
Test Teardown     Fechar browser

*** Test Cases ***
CT003.001-Verificar icones home na tela inicial
  Dado que o usuário clique no icone home
  Então deve ser redirecionado para a página de login

CT003.002-Verificar icone menssagem na tela inicial
  Dado que o usuário clique no icone de menssagem
  Então deve ser redirecionado para a página de login



