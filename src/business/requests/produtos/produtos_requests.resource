*** Settings ***
Documentation       This resource file contains requests related to products.

Resource            ../base/base_requests.resource


*** Variables ***
${PRODUTOS_RESOURCE}=       produtos


*** Keywords ***
Generic
    Pass Execution    message=${/}Adicionando produto ao carrinho...
