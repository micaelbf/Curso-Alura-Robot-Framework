*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_EMAIL}     id:email
${CAMPO_NOME}      id:name
${CAMPO_SENHA}     id:password
${CONFIRMAR_SENHA}   name:confirmarSenha
${CLICAR_BOTAO}   class:submit-button  

*** Keywords ***
Dado que o usuário clique em Quero me cadastrar
    Click Element    //a[contains(.,'Quero me cadastrar')]

E preencha email, nome, senha e confirmar senha corretamente e clicar em cadastrar
    ${Email}                                      FakerLibrary.Email                               
    Input Text      ${CAMPO_EMAIL}                ${Email}
    ${Nome}                                       FakerLibrary.Name    
    Input Text      ${CAMPO_NOME}                 ${Nome}
    ${Senha}                                      FakerLibrary.Password
    Input Text      ${CAMPO_SENHA}                ${Senha}
    Input Text      ${CONFIRMAR_SENHA}            ${Senha}
    Click Button    ${CLICAR_BOTAO}            

Entao ele deve ser redirecionado para a página de pets
    Sleep    2s
    Element Should Be Visible    class:pet-container
