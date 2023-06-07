*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL_AMAZON}                        https://www.amazon.com.br/
${HOME_TITLE}                        Amazon.com.br | Tudo pra você, de A a Z.
${HOME_CAMPO_PESQUISA_PRODUTOS}      id=twotabsearchtextbox
${HOME_SEARCH}                       id=nav-search-submit-button
${HOME_RESULTADO_PESQUISA}           //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
${HOME_PRIMEIRO_PRODUTO}             (//img[contains(@class,'s-image')])[2]
${HOME_DETALHE_PRODUTO}              //h2[contains(.,'Detalhes Técnicos')]
${HOME_ADICIONAR_PRODUTO_CARRINHO}   id=add-to-cart-button 
${CART_MENSAGEM_CONFIRMACAO}         //span[contains(.,'Adicionado ao carrinho')]
${CART_MENU}                         id=nav-cart-count
${CART_CAMPO_SUBTOTAL}               sc-subtotal-label-buybox
${CART_QUANTIDADE}                   Subtotal (1 item):

*** Keywords ***
Dado que o usuário está na página inicial da Amazon
    Go To                            ${URL_AMAZON}
    Title Should Be                  ${HOME_TITLE}

Quando o usuário realiza a pesquisa pelo termo "${HOME_PRODUTO}"
    Input Text                       ${HOME_CAMPO_PESQUISA_PRODUTOS}    ${HOME_PRODUTO}
    Click Element                    ${HOME_SEARCH}
    Sleep  2s
    
Então os resultados da pesquisa são exibidos
    Element Should Be Visible        ${HOME_RESULTADO_PESQUISA} 

Quando o usuário clica no primeiro resultado da pesquisa
    Click Element                    ${HOME_PRIMEIRO_PRODUTO}  

Então o detalhe do produto é exibido
    Element Should Be Visible        ${HOME_DETALHE_PRODUTO}
      
Quando o usuário clica no botão "Adicionar ao carrinho"  
    Click Element                    ${HOME_ADICIONAR_PRODUTO_CARRINHO}
    
Então o produto é adicionado ao carrinho com sucesso
    Element Should Be Visible        ${CART_MENSAGEM_CONFIRMACAO}

E o carrinho exibe uma quantidade de itens igual a 1
    Click Element                    ${CART_MENU} 
    Element Should Contain           ${CART_CAMPO_SUBTOTAL}     ${CART_QUANTIDADE} 

    