*** Settings ***
Resource        ../resources/main.robot
Test Setup      Dado que o usuário acesse o site organo
Test Teardown   Fechar o navegador

*** Test Cases ***
Verificar se as messagens de erro são apresentadas, qundo os campos obrigatórios não são preencidos

    Dado que o usuário clique no botão criar card
    Então o sistema deve apresentar as menssagens de compo obrigatório