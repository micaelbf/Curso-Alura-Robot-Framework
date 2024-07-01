*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao

@{selecionar_times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
Dado que o usuário preencha os campos do formulário
    ${Nome}           FakerLibrary.First Name 
    Input Text      ${CAMPO_NOME}      ${Nome}
    ${Cargo}          FakerLibrary.Job  
    Input Text      ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}         FakerLibrary.Image Url    width=100     height=100
    Input Text      ${CAMPO_IMAGEM}    ${Imagem}
    Click Element   ${CAMPO_TIME} 
    Click Element   ${selecionar_times}[0]

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

Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que o usuário preencha os campos do formulário
        Click Element    ${time}
        E clique no botão criar card
    END
    Sleep    10s

Dado que o usuário clique no botão criar card
    Click Button    ${BOTAO_CARD}
    
Então o sistema deve apresentar as menssagens de compo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
    

