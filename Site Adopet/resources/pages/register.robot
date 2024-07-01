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

Dado que o usuário clique em já tenho conta
    Click Element    //a[contains(.,'Já tenho conta')]

E insira usuário e senha corretamente e clique em entrar
    Input Text        ${CAMPO_EMAIL}    teste10@email.com
    Input Password    ${CAMPO_SENHA}    Senha1234
    Click Element    class:submit-button

Então ele deve ser redirecionado para a página pets
    Sleep    2s
    Location Should Be    https://adopet-challenge.vercel.app/pets

E clique em entrar sem digitar as credenciais de login
    Click Button    ${CLICAR_BOTAO}  

Então deve receber as menssagens de erro para inserir email e senha
    Element Should Be Visible    //div[contains(.,'Insira seu email')]
    Element Should Be Visible    //div[contains(.,'Insira sua senha')]

E clique em cadastrar sem preencher o formulário
    Click Button    ${CLICAR_BOTAO}

Então deve receber as menssagens de erro de compos obrigatórios
    Element Should Be Visible    //div[contains(.,'email é obrigatório')]
    Element Should Be Visible    //div[contains(.,'nome é obrigatório')]
    Element Should Be Visible    //div[contains(.,'senha é obrigatória')]
    Element Should Be Visible    //div[contains(.,'confirmação de senha obrigatória')]  