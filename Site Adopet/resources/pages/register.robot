*** Settings ***
Resource    ../main.robot
Library    XML

*** Variables ***
${CAMPO_EMAIL}         id:email
${CAMPO_NOME}          id:name
${CAMPO_SENHA}         id:password
${CONFIRMAR_SENHA}     name:confirmarSenha
${CLICAR_BOTAO}        class:submit-button

*** Keywords ***

Dado que o usuário clique em "Já tenho conta"
  Click Element    //a[@href='/login']
Quando inserir um usuário válido
  Input Text        ${CAMPO_EMAIL}    teste10@email.com
  Input Password    ${CAMPO_SENHA}    Senha1234
E clicar em "Entrar"
  Click Element    ${CLICAR_BOTAO} 
Então ele deve ser redirecionado para a página de adoção de pets
  Sleep    2s
  Location Should Be    https://adopet-challenge.vercel.app/pets

Dado que o usuário clique em "Quero me cadastrar"
  Click Element  //a[@href='/cadastro']
Quando digitar os os campos email, nome, senha e confirmar sua senha
  ${Email}      Fakerlibrary.Email
  Input Text    ${CAMPO_EMAIL}        ${Email}
  ${Nome}       Fakerlibrary.Name 
  Input Text    ${CAMPO_NOME}         ${Nome}
  ${Senha}      Fakerlibrary.Password
  Input Text    ${CAMPO_SENHA}        ${Senha}
  Input Text    ${CONFIRMAR_SENHA}    ${Senha}
E clicar no botão "Cadastrar"
  Click Element    ${CLICAR_BOTAO}
Então o usuário deve receber a menssagem de cadastro realizado com sucesso e ser redirecionado para a página de adoção de pets
  Sleep    2s
  Location Should Be            https://adopet-challenge.vercel.app/pets
