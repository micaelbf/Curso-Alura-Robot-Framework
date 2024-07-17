*** Settings ***
Resource    ../main.robot

*** Keywords ***

Dado que o usuário clique no icone home
    Click Element    //img[@alt='link para a homepage']
Dado que o usuário clique no icone de menssagem  
    Click Element    //img[@alt='link para enviar mensagem']
Então deve ser redirecionado para a página de login
    Location Should Be    https://adopet-challenge.vercel.app/login

