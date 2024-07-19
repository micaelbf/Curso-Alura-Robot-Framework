*** Settings ***
Resource    ../main.robot

*** Variables ***
${CLICAR_LOGIN}        //a[@href="/login"]
${EMAIL}               id:email
${PASSWORD}            id:password
${CLICAR_BOTAO}        class:submit-button

*** Keywords ***
Dado que o usuário clique em "Já tenho conta"
    Click Element     ${CLICAR_LOGIN}
Quando inserir um usuário e senha válidos
    Input Text        ${EMAIL}       ana@email.com
    Input Text        ${PASSWORD}    Senha123 
E clicar em "Entrar"
    Click Element     ${CLICAR_BOTAO}
Então ele deve ser redirecionado para a página de adoção de pets
    Sleep    2
    Location Should Be    https://adopet-challenge.vercel.app/pets
Quando clicar em entrar sem digitar as credenciais de login
    Click Element     ${CLICAR_BOTAO}
Então deve receber as menssagens de erro "Insira seu email" e "Insira sua Senha"
    Element Should Be Visible      //div[@class='erro'][contains(.,'Insira seu email')]
    Element Should Be Visible      //div[@class='erro'][contains(.,'Insira sua senha')]
    

