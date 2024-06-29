*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary    locale=pt_BR
Resource        setup_teardown.robot
Test Setup      Dado que o usuário acesse o site organo
Test Teardown   Fechar o navegador

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se os dado são preencidos no formulário e o card é criado no time corretamente.
    Dado que o usuário preencha os campos do formulário
    E clique no botão criar card
    Então o card deve estar visível no time correto


Verificar a criação de mais de um card 
    Dado que o usuário preencha os campos do formulário
    E clique no botão criar card
    Então deve ser criado 3 cards no time esperado

*** Keywords ***
Dado que o usuário preencha os campos do formulário
    ${Nome}       FakerLibrary.First Name 
    Input Text    ${CAMPO_NOME}      ${Nome}
    ${Cargo}      FakerLibrary.Job  
    Input Text    ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}     FakerLibrary.Image Url
    Input Text    ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]

E clique no botão criar card
    Click Element    id:form-botao

Então o card deve estar visível no time correto
    Element Should Be Visible    class:colaborador

Então deve ser criado 3 cards no time esperado
    FOR    ${counter}    IN RANGE    1    3

        Dado que o usuário preencha os campos do formulário
        E clique no botão criar card                 
    
    END
    Sleep    10s