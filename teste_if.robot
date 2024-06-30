*** Settings ***
Test Setup      Log To Console    ${\n}
Test Teardown   Log To Console    ${\n}

*** Variables ***
${NUMERO}    ${-1}

*** Test Case ***
Teste de FOR do tipo IN RANGE
    Usando FOR IN RANGE

Exemplo bloco IF
    IF  ${NUMERO} > 0
        Mostrar mensagem quando o número for maior que zero
        Log  message= Você está vendo essa mensagem porque o bloco IF foi executado e sua condição é verdadeira  console=True
    ELSE
        Mostrar mensagem quando o número for menor que zero
        Log  message= Você está vendo essa mensagem porque o bloco IF foi executado e sua condição é falsa  console=True
    END

*** Keywords ***

Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}   IN RANGE  0   5
        Log To Console    Minha posição agora é: ${CONTADOR}
    END

Mostrar mensagem quando o número for maior que zero
    Log To Console    O número [${NUMERO}] é maior que zero!

Mostrar mensagem quando o número for menor que zero
    Log To Console    O número [${NUMERO}] é menor que zero!