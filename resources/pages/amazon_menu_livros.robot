*** Settings ***
Resource    ../main.robot

*** Variables ***
${LIVROS_TITLE}                Livros | Amazon.com.br
${LIVROS_TEXTO}                Loja de Livros
${LIVROS_TITULO_PAGINA}        //h2[contains(.,'Loja de Livros')]

*** Keywords *** 
Então o título da página deve ficar "Livros | Amazon.com.br"
    Wait Until Element Is Visible      ${LIVROS_TITULO_PAGINA} 
    Title Should Be                    ${LIVROS_TITLE} 

E o texto "Loja de Livros" deve ser exibido na página
    Page Should Contain                ${LIVROS_TEXTO}   