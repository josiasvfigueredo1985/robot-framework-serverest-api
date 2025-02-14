*** Settings ***
Documentation       This resource file contains requests related to 'carrinhos'.

Resource            ../base/base_requests.resource


*** Variables ***
${CARRINHOS_RESOURCE}=      carrinhos


*** Keywords ***
Generic
    Pass Execution    message=${/}Adicionando produto ao carrinho...
