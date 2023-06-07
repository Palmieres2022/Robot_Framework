*** Settings ***
Resource    ../main.robot

*** Variables ***
${REGISTRO_CRIAR_CONTA}              createAccountSubmit
${REGISTRO_CAMPO_NOME}               ap_customer_name
${REGISTRO_CAMPO_EMAIL}              ap_email
${REGISTRO_CAMPO_SENHA}              ap_password
${REGISTRO_CAMPO_CHECK_SENHA}        ap_password
${REGISTRO_BOTAO_CONTINUAR}          continue
${REGISTRO_MSG_ALERT_NOME}           Insira seu nome
${REGISTRO_MSG_ALERT_SENHA}          Digite seu e-mail ou número de telefone celular
${REGISTRO_MSG_ALERT_CHECK_SENHA}    Mínimo de 6 caracteres necessários
*** Keywords ***
E clicar em "Criar sua conta Amazon"
    Wait Until Element Is Visible    ${REGISTRO_CRIAR_CONTA}
    Click Element                    ${REGISTRO_CRIAR_CONTA}

Então o formulário de cadastro é exibido para preenchimento
    Wait Until Element Is Visible    ${REGISTRO_CAMPO_NOME} 
    Page Should Contain Element      ${REGISTRO_CAMPO_NOME} 
    Wait Until Element Is Visible    ${REGISTRO_CAMPO_EMAIL}
    Page Should Contain Element      ${REGISTRO_CAMPO_EMAIL}
    Wait Until Element Is Visible    ${REGISTRO_CAMPO_SENHA}
    Page Should Contain Element      ${REGISTRO_CAMPO_SENHA}
    Wait Until Element Is Visible    ${REGISTRO_CAMPO_CHECK_SENHA} 
    Page Should Contain Element      ${REGISTRO_CAMPO_CHECK_SENHA}

E clicar em "Continuar" sem preencher o formulário
    Click Element                    ${REGISTRO_BOTAO_CONTINUAR} 

Então o sistema deve emitir as mensagens de preenchimento obrigatório
    Page Should Contain              ${REGISTRO_MSG_ALERT_NOME} 
    Page Should Contain              ${REGISTRO_MSG_ALERT_SENHA}
    Page Should Contain              ${REGISTRO_MSG_ALERT_CHECK_SENHA} 
    