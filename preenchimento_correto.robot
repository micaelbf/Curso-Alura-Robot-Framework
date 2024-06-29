*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Resource        preenchimento_incorreto.robot
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

*** Keywords ***
Dado que o usuário preencha os campos do formulário
    Input Text    id:form-nome      Akemi
    Input Text    id:form-cargo     Desenvolvedora
    Input Text    id:form-imagem    https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
E clique no botão criar card
    Click Element    id:form-botao
Então o card deve estar visível no time correto
    Element Should Be Visible    class:colaborador
    
