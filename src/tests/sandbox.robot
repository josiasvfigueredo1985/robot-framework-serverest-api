*** Settings ***
Library     Collections
Library     String


*** Variables ***
${count_start}          1
${products_qty}         5
@{cart_products_ids}    @{EMPTY}


*** Test Cases ***
Teste Genérico - Adicionar Produtos ao Carrinho
    WHILE    ${count_start} <= ${products_qty}
        ${response_product}    Register New Random Product    100    2
        ${product_id}    Get From Dictionary    ${response_product}    _id
        Append To List    ${cart_products_ids}    ${product_id}
        ${count_start}    Evaluate    ${count_start} + 1
    END
    Log    Lista de produtos no carrinho: ${cart_products_ids}


*** Keywords ***
Register New Random Product
    [Arguments]    ${price}    ${quantity}
    ${product_id}    Generate Random String    8    [LETTERS][NUMBERS]
    ${response_product}    Create Dictionary    _id=${product_id}
    RETURN    ${response_product}
