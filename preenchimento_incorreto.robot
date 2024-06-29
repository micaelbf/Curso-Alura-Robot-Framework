*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Test Setup      Dado que o usuário acesse o site organo
Test Teardown   Fechar o navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar se as messagens de erro são apresentadas, qundo os campos obrigatórios não são preencidos

    Dado que o usuário clique no botão criar card
    Então o sistema deve apresentar as menssagens de compo obrigatório

*** Keywords ***
Dado que o usuário clique no botão criar card
    Click Button    ${BOTAO_CARD} 
Então o sistema deve apresentar as menssagens de compo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro    
