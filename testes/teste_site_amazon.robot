*** Settings ***
Documentation    Esta suite testa o site da amazon.com.br       

Resource         ../resources/main.robot
Test Setup       Abrir o navegador
Test Teardown    Fecha o navegador

*** Test Cases ***
CT 01 - Usuário acessa o site da Amazon, procura um produto e adiciona ao carrinho 
    [Documentation]    Funcionalidade: Adicionar produto ao carrinho na Amazon                                        
    [Tags]    Carrinho de compras
    Dado que o usuário está na página inicial da Amazon
    Quando o usuário realiza a pesquisa pelo termo "Kindle"
    Então os resultados da pesquisa são exibidos
    Quando o usuário clica no primeiro resultado da pesquisa
    Então o detalhe do produto é exibido
    Quando o usuário clica no botão "Adicionar ao carrinho"
    Então o produto é adicionado ao carrinho com sucesso
    E o carrinho exibe uma quantidade de itens igual a 1

CT 02 - Acesso ao menu Livros
    [Documentation]    Testar se o Menu Livros está funconando como esperado
    [Tags]    Menu Livros
    Dado que o usuário está na página inicial da Amazon 
    Quando acessar o menu "Livros" 
    Então o título da página deve ficar "Livros | Amazon.com.br"
    E o texto "Loja de Livros" deve ser exibido na página
