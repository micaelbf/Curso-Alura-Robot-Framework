*** Settings ***
Resource    ../main.robot

*** Variables ***
${CADASTRAR}           //a[@href='/cadastro']
${CAMPO_EMAIL}         id:email
${CAMPO_NOME}          id:name
${CAMPO_SENHA}         id:password
${CONFIRMAR_SENHA}     name:confirmarSenha
${CLICAR_BOTAO}        class:submit-button

*** Keywords ***
Dado que o usuário clique em "Quero me cadastrar"
  Click Element      ${CADASTRAR}

Quando digitar os os campos email, nome, senha e confirmar sua senha
  ${email}      Fakerlibrary.Email
  Input Text    ${CAMPO_EMAIL}        ${email}
  ${nome}       Fakerlibrary.Name 
  Input Text    ${CAMPO_NOME}         ${nome}
  ${senha}      Fakerlibrary.Password
  Input Text    ${CAMPO_SENHA}        ${senha}
  Input Text    ${CONFIRMAR_SENHA}    ${senha}

E clicar no botão "Cadastrar"
  Click Element    ${CLICAR_BOTAO}

Então o usuário deve receber a menssagem de cadastro realizado com sucesso e ser redirecionado para a página de adoção de pets
  Sleep    2s
  Location Should Be            https://adopet-challenge.vercel.app/pets

Quando clicar em "Cadastrar" sem preencher os campos do formulário
  Click Element    ${CLICAR_BOTAO} 

Então deve receber as menssagens de erro "email obrigatório", "nome é obrigatório", "senha é obrigatória" e "confirmação de senha obrigatória"
  Element Should Be Visible    //div[@class='erro'][contains(.,'email é obrigatório')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'nome é obrigatório')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'senha é obrigatória')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'confirmação de senha obrigatória')]

Quando digitar os campos "email", "nome", "senha" e "confirmar sua senha" incorretamente 
  Input Text    ${CAMPO_EMAIL}      fasdf.com
  Input Text    ${CAMPO_NOME}       as
  Input Text    ${CAMPO_SENHA}      123
  Input Text    ${CONFIRMAR_SENHA}  321

Então deve ser apresentado as mensagen de erro "email inválido", "mínimo de 3 caracteres", "senha deve ter no mínimo 6 caracteres", "as senhas não combinam"
  Element Should Be Visible    //div[@class='erro'][contains(.,'email inválido')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'mínimo de 3 caracteres')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'senha deve ter no mínimo 6 caracteres')]
  Element Should Be Visible    //div[@class='erro'][contains(.,'as senhas não combinam')]

Quando ele inserir um numero no campo "nome"
  ${numero}      Fakerlibrary.Numerify
  Input Text    ${CAMPO_NOME}    ${numero}    
  
Então deve ser apresentado a menssagem de "caracter inválido"
  Element Should Be Visible    //div[@class='erro'][contains(.,'caracter inválido')]